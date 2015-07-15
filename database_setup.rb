CONNECTION = SQLite3::Database.new("assignments.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, general_info TEXT NOT NULL, github_link TEXT NOT NULL, co_workers TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS links (id INTEGER PRIMARY KEY, link TEXT NOT NULL, relative_assignment INTEGER, FOREIGN KEY(relative_assignment) REFERENCES assignments(id));")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT NOT NULL, password TEXT NOT NULL)")


CONNECTION.results_as_hash = true
