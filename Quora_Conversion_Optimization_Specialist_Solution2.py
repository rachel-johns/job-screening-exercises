# Simulating the random assignment of users to different variants

import random

# Simulate user assignment to groups
def assign_variant():
    variants = ['Control (A)', 'Variant 1 (B)', 'Variant 2 (C)', 'Variant 3 (D)']
    return random.choice(variants)

# Simulate a batch of users being assigned to different variants
users = [assign_variant() for _ in range(100)]

# Count how many users were assigned to each group
from collections import Counter
user_counts = Counter(users)

print(user_counts)
