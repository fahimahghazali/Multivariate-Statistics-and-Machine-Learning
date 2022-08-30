<h1 align="center">Multivariate Statistics and Machine Learning</h1>

### Project Objective
Based on the data provided, the report deals with simplifying the dataset for further analysis through clustering, specifically using the _K_-means algorithm. Since the algorithm requires a user-input number of clusters, clustering using a range of number of clusters is done to compare each of its sum of squares to find the optimal _K_ number of clusters.

#### -- Project Status: [Completed]

### Methods used
- Multivariate statistics
- _K_-means clustering
- Sum of squares(SS) analysis

### Technologies
- LateX
- R

## Project Description
The  data used for this project can be obtained from [Palmer Penguins](https://pursuit.unimelb.edu.au/articles/how-do-penguins-find-their-mate-in-a-sea-of-tuxedos) with 4 variables, `bill_length_mm`; `bill_depth_mm`; `flipper_length_mm`; and `body_mass_g`. With the _n = 333_ observations, the first section explores the dataset through descriptive statistics to determine the user-input _K_ number of clusters. The covariance matrix is also obtained and studied to scale the data before the clustering can be done. 

The second section explains the methods used to cluster the data, through an overview of the algorithm, as well as the commands used in R. How the optimal number of clusters is recognised is further detailed as reference for the dicussion of this report.

The third and final section of the report discusses the results of the methods in the previous section, using user-input _K = 3_ which is chosen when analysing the scatterplot of the variables against one another. The counts of the clustering done is compared to two of the known clusters provided in the dataset, `L.species`; `L.islands`, to see how the variables affect the clustering. These counts are then visualised through scatterplots of two of the variables, where the different colours indicate the _K_-means clusters while the point characters separate the data points by its known clusters. It's found that the clustering done matches up more with the species classification due to the smaller number of mislassified samples in comparison to the island grouping. The discussion is then concluded with plot of the within group and between group variation against number of clusters, telling us that the chosen _K_ is the optimal number of clusters.

The final report can be read [here](https://github.com/fahimahghazali/Multivariate-Statistics-and-Machine-Learning/blob/main/MSML_cw-5.pdf).

## Needs of this project

- Machine learning 
- Writeup

## Author
**Nurfahimah Mohd Ghazali**

- [Profile](https://github.com/fahimahghazali "Fahimah Ghazali")
- [Email](mailto:fahimahghazali@icloud.com?subject=Hi% "Hi!")
