AUCSS: A Credit Scoring Software
========================================================
author: Arthur 
date: 05/22/2015

Course Project: Developing Data Products

Credit Score
========================================================

A credit score is a numerical expression based on a person's characteristics (e.g., salary, marital status, etc.)  that represents the creditworthiness of that person.

My Project is about an analytics software that assigns credit scores to future clients of a bank.


Data
========================================================

In order to build my analytics solution, I downloaded a data set from the UCI repository, available at https://archive.ics.uci.edu/ml/datasets/Statlog+%28German+Credit+Data%29

Those are the variables I used in my model:



```r
data_train <- read.csv("train.csv")
names(data_train)
```

```
 [1] "checking_status"        "duration"              
 [3] "credit_history"         "purpose"               
 [5] "credit_amount"          "savings_status"        
 [7] "employment"             "installment_commitment"
 [9] "personal_status"        "other_parties"         
[11] "residence_since"        "property_magnitude"    
[13] "age"                    "other_payment_plans"   
[15] "housing"                "existing_credits"      
[17] "job"                    "num_dependents"        
[19] "own_telephone"          "foreign_worker"        
[21] "target"                
```

Model
========================================================

After splitting my data into training and testing sets, I built a decision tree model. That is the resulting confusion matrix of my model.


```
      True False
True   0.5   0.0
False  0.1   0.4
```


Deployment
========================================================
The deployed model is available at https://arthur-carvalho.shinyapps.io/Assignment1/

Thank you!!
