HMIS Data Analyst (Oracle)
==========================
- **Version:**  2.1.1
- **Date:**  10 April 2014
- **RDBMS:**  Oracle
- **Administrators:**  Jason Rodriguez (Vanderbilt University); Brian Vogler (); Tony Zhang (Pathways Community Network Institute); Dave Totten (Georgia Department of Community Affairs)
- **Contact:**  jsn.rgz@gmail.com; brian@vogler.com; tony.zhang@pcni.org; dave.totten@dca.ga.gov

Description
------------
- HMIS Data Analyst is an open-source library of applications designed to provide an intuitive platform for analysis of Homeless Management Information System (<a href=http://en.wikipedia.org/wiki/Homeless_Management_Information_Systems>HMIS</a>) data. The ultimate goal of this project is to help end homelessness by creating transparency, advancing knowledge, and facilitating research related to America's homeless service provider systems.

<div align="center"><u><a href=http://72.242.201.147:3838/Data%20Quality%20JDBC/>Check out our first app!</a></u></div>

General Usage Notes
--------------------
- The HMIS Data Analyst applications are written using the open-source <a href=http://cran.us.r-project.org/>R software environment</a> (version >= 3.0.0). In particular, they utilize the <a href=http://shiny.rstudio.com/>Shiny package</a> (GitHub <a href=https://github.com/rstudio/shiny>here</a>) for R. The technical goal is to present a simple web-based user interface that translates R statistical analyses into useful information that ordinary people can easily digest.
- For now, this project's primary source of data comes from administrative data collected by homeless service providers throughout the entire state of Georgia. Every night, 5 years worth of production data is copied to a static schema. We have access to that copy.
- This open-source version of HMIS Data Analyst currently requires a keyfile to connect to the RDBMS. The keyfile is not public and must be stored locally on the contributor's machine. Please contact one of the administrators for a copy.
- Data Analyst applications are browser-based--but they will not work properly on Internet Explorer. Chrome is recommended.
- The primary languages used in writing these applications are R and SQL. To a small extent, they also utilize HTML and JavaScript. A contributor with a working knowledge of JavaScript would have the potential to vastly improve the functionality and appearance of Data Analyst.
- Every time a new version of Data Analyst is completed, the administrators will copy it onto a private Linux server and publish it to the web. 

Installation Notes for Contributors
-------------------------------------------
- The HMIS Data Analyst open-source project requires a local installation of R version >= 3.0.0.
- Applications will have varying R package dependencies (see source code). All dependencies must be installed before applications are sourced.
- This project's applications currently require that the JDBC driver <a href=http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html>ojdbc6.jar</a> be located in the following directory: *~\Documents\HMIS Data Analyst\lib\*

First Oracle, Then MySQL
-------------------------
- The database administrators are in the process of transitioning to a new open-source version of HMIS (OpenHMIS). At the moment, the Data Analyst project is being developed for the existing Oracle RDBMS. Eventually, the entire project will be converted to communicate with a MySQL RDBMS. To enable current development and ease this future conversion, two duplicate repositories have been created on the hmis-analyst GitHub.
