# Prerequisites
here I will go over the steps we need to do to run this application.

## 1-Install PostgreSQL
 to install the PostgreSQL from official [website](https://www.postgresql.org/download) and follow instructions
## 2- Create Db , Migrate the sample data
  there are multiple ways to manage your db but i like to use the [DBeaver](https://dbeaver.io/download/) since its cross-platform.
  * Create a new db named library
  * Run Execute Script and run the file config/database_seed.sql
  * Refresh and Check that the file was executed Correctly
## 3- Update the config file
  config file is config/default.yaml, update username,password,port accordingly



