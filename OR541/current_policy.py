import pandas as pd

# Loading data from excel file
df = pd.read_excel('SuperChipData.xlsx', sheet_name='Production Costs')
df_ship = pd.read_excel('SuperChipData.xlsx', sheet_name='Shipping Costs')
df_prod_cap = pd.read_excel('SuperChipData.xlsx', sheet_name='Production Capacity')
df_demand = pd.read_excel('SuperChipData.xlsx', sheet_name='Sales Region Demand')
df_production = pd.read_excel('chip.xlsx')
#pd.read_csv('Chip_Productio.csv')

# Creating list of facilities, chips and regions
facilities = df['Facility'].unique()
chips = df['Computer Chip'].unique()
regions = df_ship['Sales Region'].unique()

# Creating production costs dictionary
prod_costs = {(row['Computer Chip'], row['Facility']): row['Production Cost ($ per chip)'] for index, row in df.iterrows()}

# Creating shipping costs dictionary
shipping_costs = {(row['Computer Chip'], row['Facility'], row['Sales Region']): row['Shipping Cost ($ per chip)'] for index, row in df_ship.iterrows()}

# creating production capacity dictionary
prod_cap = {(row['Facility']): row['Computer Chip Production Capacity (thousands per year)']*1000 for index, row in df_prod_cap.iterrows()}

# creating demand dictionary
demand = {(row['Computer Chip'], row['Sales Region']): row['Yearly Demand (thousands)']*1000 for index, row in df_demand.iterrows()}

# creating a dictionary for our recommended chip_production
quantity = {(row['Chip'], row['Facility']): row['Value'] for index, row in df_production.iterrows()}


# Creating a dictionary to store the total demand for each chip type
total_demand = {}
for i in chips:
    chip_demand = 0
    for key in demand.keys():
        if key[0] == i:
            chip_demand += demand[key]
    total_demand[i] = chip_demand

# new_demand = {}
# for key, value in total_demand.items():
#     new_demand[key] = value * 1.1

# Calculating the proportion of production capacity for each facility
total_prod_cap = sum(prod_cap.values())
prod_cap_prop = {j: cap/total_prod_cap for j, cap in prod_cap.items()}

#Calculating the production quantity for each chip and facility
prod_qty = {}
for i in chips:
    for j in facilities:
        prod_qty[(i,j)] = prod_cap_prop[j] * total_demand[i]

# # Printing the production quantity for each chip and facility 
# for (i,j), qty in prod_qty.items():
#     print(f"Production quantity for {i} at {j}: {qty}")


# Calculating the production quantity for each facility
prod_qty_fac = {}
for j in facilities:
    prod_qty_fac[j] = sum([prod_qty[(i,j)] for i in chips])

# Printing the production quantity for each facility 
for j, qty in prod_qty_fac.items():
    print("........................................")
    print(f"Total Production quantity at facility {j}: {qty}")

# Create a new dictionary representing chip i shipped from facility j to region k
shipped_qty = {}

for i in chips:
    for j in facilities:
        for k in regions:
            shipped_qty[(i, j, k)] = min(prod_qty[(i, j)], demand[(i, k)])

# Analysis - Calculating the current total shipping cost for all chips
total_shipping_cost = 0
for (i,j,k) in shipped_qty and shipping_costs:
    total_shipping_cost += shipping_costs[i,j,k] * shipped_qty[i,j,k]
print(".....................................")
print("Total shipping cost: ", total_shipping_cost)


# Analysis - Calculating the current total production cost for all chips
total_prod_cost = 0
for i,j in prod_qty:
    if (i,j) in prod_qty.keys():
        costs = prod_costs[(i,j)]
        cost_prod = prod_qty[(i,j)] * costs
        total_prod_cost += cost_prod
print("...................................")
print("The current total Production cost is: ", total_prod_cost)


#Creating a dictionary to store the total production cost for each facility

new_cost = {}
for j in facilities:
    for i in chips:
        cost = 0
        if (i,j) in prod_costs.keys():
            costs = prod_costs[(i,j)]
            quat = 0
            for key, value in prod_qty.items():
                if key[1] == j:
                    quat += value
        cost_prod = quat * costs
        cost += cost_prod
        new_cost[j] = cost
        
for j in facilities:
    print("........................................................")
    print(f"The cost of production in {j} facility is {new_cost[j]}")


# Creating a dictionary to store the total production cost for each facility if technology is implemented
reduced_cost = {}
for j in facilities:
    reduced_cost[j] = 0.85 * new_cost[j]

max_key = max(reduced_cost, key=reduced_cost.get)
print("...................................................")
print(f"We Recommended new technology go to {max_key} facility if using the current policy")


new_total_prod_cost = 0
for i,j in quantity:
    if (i,j) in quantity.keys():
        costs = prod_costs[(i,j)]
        cost_prod = quantity[(i,j)] * costs
        new_total_prod_cost += cost_prod
print(".............................................")
print("The new total Production cost from our recommendation is: ", new_total_prod_cost)


new_new_cost = {}
for j in facilities:
    for i in chips:
        cost = 0
        if (i,j) in prod_costs.keys():
            costs = prod_costs[(i,j)]
            quat = 0
            for key, value in quantity.items():
                if key[1] == j:
                    quat += value
        cost_prod = quat * costs
        cost += cost_prod
        new_new_cost[j] = cost
        
for j in facilities:
    print("........................................................")
    print(f"The cost of production in {j} facility is {new_new_cost[j]}")


# Creating a dictionary to store the total production cost for each facility if technology is implemented
new_reduced_cost = {}
for j in facilities:
    new_reduced_cost[j] = 0.85 * new_new_cost[j]

new_max_key = max(new_reduced_cost, key=new_reduced_cost.get)
print("...................................................")
print(f"We Recommended new technology go to {new_max_key} facility")