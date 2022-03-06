# DataAnalysis_CaseStudy1
I have followed a six step procedure to analyze the data for the Business Task assigned as a part of case study for the "Google Data Analytics" Certification.
Below given are six steps followed.
1. Ask
2. Prepare
3. Process
4. Analyze
5. Share
6. Act

## Ask Phase

**Key tasks**
1. Identify the business task
2. Consider key stakeholders

**Deliverables**
* A clear statement of the business task
* CaseStudy_Guideline.docx has the deliverable ready.

## Prepare Phase

**Key tasks**
1. Download data and store it appropriately.
2. Identify how it’s organized.
3. Sort and filter the data.
4. Determine the credibility of the data.

**Deliverables**
* A description of all data sources used
* Follow the give [Kaggle Link](https://www.kaggle.com/riayadav19/casestudy1-cyclisticdataset) for the stored and filtered dataset.


## Process Phase

### NOTE: Only 6 months of data was chosen for the first phase of analysis all though dataset have whole 12 months of data, which can be used in future.

**Key tasks**
1. Check the data for errors.
2. Choose your tools.
3. Transform the data so you can work with it effectively.
4. Document the cleaning process.

**Deliverables**
* Documentation of any cleaning or manipulation of data

**Steps Taken to Clean**
1. Longtitude & Latitude column has no use for my current analysis hence using excel those columns were deleted.
2. ride_length column was added by performing the subtract operation on column ended_at(D2) and started_at(C2) e.g. D2-C2 and so on data was filled for rest rows of the ride_length column.
3. day_of_week column was added by using excel function **_WEEKDAY(serial_number,[return_type])_** 
        _Serial_number(Required)_ - can either be cell reference having data value or we can provide actual dates inside data().
        _return type_ - is a number 
                        e.g 1 represents the format - Numbers 1 (Sunday) through 7 (Saturday).
                            2 represents the format - Numbers 1 (Monday) through 7 (Sunday).
4. SQL was chosen for further steps as it was a huge dataset of almost 60-90k rows per month data.
      1. Create a database to work with named *case_study1*
      2. Create a schema for one table jan2021_tripdata and ran the below commands to copy same schema for remaining tables.
      
      ```bash
      SELECT * INTO feb2021_tripdata FROM jan2021_tripdata; 
      ```
        
      3. Loaded the csv file from commandline into their respective tables
      
      ```bash
        LOAD DATA INFILE "filepath/jan2021_tripdata.csv" INTO TABLE feb2021_tripdata FIELDS TERMINATED BY ',' IGNORE 1 ROWS;
      ```
  
     4. I prefered modifying certain column datatypes for better ananlysis details of which are in [processinStep1_ChangeDataTypes.sql](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/blob/main/Process_Phase) file under *_Process_phase folder_*.


## Analyze Phase

### NOTE: Only 6 months of data was chosen for the first phase of analysis all though dataset have whole 12 months of data, which can be used in future.

**Key tasks**
1. Aggregate your data so it’s useful and accessible.
2. Organize and format your data.
3. Perform calculations.
4. Identify trends and relationships.

**Deliverables**
* A summary of your analysis

**Steps Taken to Analyze**
1. Performed some basic analysis on just January month data to understand the data better check [JanDataAnalysis.sql](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/tree/main/Analyze_Phase) for the reference
2. Stacked the whole data of 6 months into one and performed certain calculation and analysis based on ride_lengths,members distribution etc can check [StackedDataAnalysi_Part1.sql](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/tree/main/Analyze_Phase) for the reference. UserData.csv is the created at the end of this analysis.
3. Further did some more analysis based on rideable_types used by different members can check [StackedDataAnalysi_Part2.sql](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/tree/main/Analyze_Phase) for the reference. rideabltTyepData.csv is the created at the end of this analysis.
4. Utilized UserData.csv & rideabltTyepData.csv as main two tables for final analysis.


## Share Phase

**Key tasks**
1. Determine the best way to share your findings.
2. Create effective data visualizations.
3. Present your findings.
4. Ensure your work is accessible.

**Deliverables**
* Supporting visualizations and key findings
* Refer [DataVizReport](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/tree/main/Share_Phase) & [Case_study1 ppt](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/tree/main/Share_Phase)


## Act Phase

**Key tasks**
1. Create your portfolio.
2. Add your case study.
3. Practice presenting your case study to a friend or family member

**Deliverables**
* Your top three recommendations based on your analysis
* Refer [Case_study1 ppt](https://github.com/RiaYadav/DataAnalysis_CaseStudy1/tree/main/Share_Phase) for top 3 recommendations




  





