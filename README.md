Given the following data set (posting_data.json) for a single Posting with multiple spaces within it, write an algorithm to calculate the "Priced From" (lowest cost) for each team size 1 through 30 for the Posting by combining spaces if needed to accommodate the team size, into a single Booking.

For each space:
  - 'available_space' is the number of available units
  - 'price' for a space of type 'open_workspace' is per person
  - 'price' for a space of type 'private_office' is for the entire office, whether its fully utilised or not
