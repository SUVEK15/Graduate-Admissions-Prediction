# Graduate-Admissions-Prediction
This project is about predicting the chances of admission in graduate school based on following parameters i.e. GRE Score, TOEFL Score, SOP, LOR and CGPA. 
Based on these parameters, we run ML classification algorithms to determine whether there is a chance for a student to gain admissions based on his performance in above mentioned parameters.

This data is was taken from Kaggle and was created by following individuals : Mohan S Acharya, Asifa Armaan, Aneeta S Antony. This is in reference to the paper published by them i.e. A Comparison of Regression Model for Prediction of Graduate Admissions, IEEE Internation Conference on Computational Intelligence in Data Science 2019.

The methodology of analysis is as follows:
1. Load the data into R
2. Clean the data as required. Here an extra column was added "Chances" which converted the column "Chances.of.Admit" probabilities values into binary representation i.e. "Yes" or "No". Here Yes was defined as probabilities above 0.5 and No as probabilities below 0.5
3. Basic exploratory analysis were performed on the dependent data variables to understand the gist of the data.
4. 3 classification methods are used i.e. Naive Bayes Classification, Decision Trees and Random Forest Classification
5. The basic training set is then divided into internal training and testing set using sampling and above 3 classification methods are applied on the same.
5. The accuracy level of these 3 methods are compared and the algorithm with highest accuracy is selected for further testing of test data

The "Image_1" graph shows the relationship between GRE Score vs Chance of Admit for various students with SOP bifurcation with a scale of 1-5. It shows an increasing trend as the GRE Scores increases, the chances of Admit also increases. It also confirms that belief that higher GRE Scores coupled with higher SOP normalised scores can result in better chances of admission. This is indicated by higher light blue dots towards the higher range of GRE Score

The "Image_2" plot shows a similar plot between TOEFL Score vs Chance of Admit for various students with SOP bifurcation with a scale of 1-5. Again it shows an increasing trend as TOEFL Score increases, the chances of admit also increases. This is accompanied by higher values of normalised SOP scores i.e. higher the SOP scores, higher the chances of admit.

The "Image_3" plot shows the boxplot between SOP vs Chance of Admit for various students. The boxplot also shows with increasing SOP scores, the chances of admit also increases. However, it can also be noted that for SOP scores of 2 to 4.5 scores, the variability in chances of admit is high suggesting other factors influencing the chances of admit. However, at very low and high SOP scores, the variability in chances of admit is less, suggesting two possibilities i.e. extremely low/high SOP scores almost leads to rejection/acceptance of admission.

The "Image_4" plot shows the plot between CGPA vs Chances of Admit for various students. The trend shows that as CGPA increases, the chances of admit also increases. One more interesting thing to note is the density of points near the mean line. As CGPA increases, the points are crowded near the mean line, suggesting that a high CGPA score almost leads to increased chances of admit.

Following were the accuracies obtained after running the dataset through 3 different ML classification algorithms.

Naive_Bayes Classification
Accuracy : 91.6%
95% CI : (0.851, 0.959)
p-Value: 0.711 ( There is a good chance of obtaining extreme values , thus suggesting high variability )

Random_Forest Classification
Accuracy : 100%
95% CI : (0.969, 1)
p-Value: 8.623e-05 ( There is very low chance of obtaining extreme values, thus suggesting low variability )

Decision Trees Classification
Accuracy : 90.76%
95% CI : (0.841, 0.952)
p-Value: 0.811 (There is a good chance of obtaining extreme values, thus suggesting high variability )

Thus it is clear that Random_Forest Classification is the ideal algorithm which can be used for prediction of chances of admit for this dataset
