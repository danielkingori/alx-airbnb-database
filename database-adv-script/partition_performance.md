performance improvements partition:

- Reduced Execution Time: The partitioned query should execute significantly faster because the database will only scan the relevant partitions (e.g., Bookings_2025_02, Bookings_2025_03, Bookings_2025_04, and Bookings_2025_05) instead of the entire table.
- Improved I/O: Partitioning reduces the amount of data that needs to be read from disk, leading to improved I/O performance.
- Better Scalability: Partitioning can improve the scalability of the database by allowing you to distribute data across multiple storage devices.