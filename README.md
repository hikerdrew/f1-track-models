# f1-track-models

## Install Database Applications

### You can use the postgres app to get the server up and running:
https://postgresapp.com

1. Download   ➜   Move to Applications folder   ➜   Double Click

2. Click "Initialize" to create a new server

3. Add postgres commands to your terminal path
    ```
    sudo mkdir -p /etc/paths.d &&
    echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
    ```

### You can use positco as a PostgresSQL client and can be found on the Mac App store: https://apps.apple.com/us/app/postico/id1031280567?mt=12

## Setting up Ergast F1 Stats database.

- Using postgres.app set up a PostgreSQL server.

- With that set up, open postico and login to the server using your mac user name and create a database named "ergast_f1_stats".

### Create the database

- Click on the SQL Query box and click the button in the middle menu bar labeld "Load Query...", load the database-ddl-commands.ddl file

- With the entire file selected press the "Execute Selection" button and it should create all the tables.

- Go back to the database page and press the refresh button at the top right of the window and all the tables should be there.

### How to import CSV files into database

- I recommend looking at the .md file called ERdiagram.md as it will be useful to see the order of the CSV files which are needed for the relations (tables) with the primary keys because they need to be imported first. This is required when adding data in a relational database like this one. I recommend the github website .md viewer as it is a wide diagram and can be hard to see in some markdown editors. You can ignore the arrows in the diagram, as there is no hierarchy. I will also put the import order in text below.

- I have created the database going from left to right by row. For example, I would import: seasons, circuits, then constructors, races, drivers, status, then constructor_results, constructor_standings, lap_times, pit_stops, qualifying, results, driver_standings. 

### Postico import feature

- In postico use the file tab in the menu bar and click on import CSV or use the shortcut command-I. Then open ergast-database-csv folder and load the first file seasons. 

- On the new window click on the "Target Table" selection drop down and click on "seasons". For what we are doing where the colmun names of the CSVs match the attribute names of the relations you can just click on "Match Columns" to the right of the Target Table drop down and click "Match Columns by Name" and you should see both names should match up for each column.

- Repeat the import process in the order mentioned until each CSV is imported.