## LCSA models


# 1. Thalamus/Striatum Separated Model

## 1.A. Thalamus
model.thalamus='
## Resting state static/dynamic functional connectivity measures

#########################################
# Static Connectivity
#########################################
SFC_T1=~Thal_SFC_v1_t1 + Thal_SFC_v2_t1 + Thal_SFC_v3_t1 + Thal_SFC_v4_t1 + Thal_SFC_v5_t1 + Thal_SFC_v6_t1 
# This specifies the measurement model for Attention at baseline
SFC_T2=~equal("SFC_T1=~Thal_SFC_v1_t1")*Thal_SFC_v1_t2+
equal("SFC_T1=~Thal_SFC_v2_t1")*Thal_SFC_v2_t2+
equal("SFC_T1=~Thal_SFC_v3_t1")*Thal_SFC_v3_t2+
equal("SFC_T1=~Thal_SFC_v4_t1")*Thal_SFC_v4_t2+
equal("SFC_T1=~Thal_SFC_v5_t1")*Thal_SFC_v5_t2+
equal("SFC_T1=~Thal_SFC_v6_t1")*Thal_SFC_v6_t2

SFC_T2 ~ 1*SFC_T1     
dSFC =~ 1*SFC_T2     
SFC_T2 ~ 0*1          
SFC_T2 ~~ 0*SFC_T2    # This fixes the variance of the COG_T2 to 0 

dSFC ~ asfc*medication_binary     # regression
SFC_T1 ~  1            
dSFC ~~  dSFC       # This estimates the variance of the change scores 
SFC_T1 ~~   SFC_T1     
dSFC~SFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables
Thal_SFC_v1_t1~~Thal_SFC_v1_t2  
Thal_SFC_v2_t1~~Thal_SFC_v2_t2 
Thal_SFC_v3_t1~~Thal_SFC_v3_t2 
Thal_SFC_v4_t1~~Thal_SFC_v4_t2 
Thal_SFC_v5_t1~~Thal_SFC_v5_t2 
Thal_SFC_v6_t1~~Thal_SFC_v6_t2 


## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Thal_SFC_v1_t1~~1*Thal_SFC_v1_t1  
Thal_SFC_v2_t1~~1*Thal_SFC_v2_t1 
Thal_SFC_v3_t1~~1*Thal_SFC_v3_t1
Thal_SFC_v4_t1~~1*Thal_SFC_v4_t1
Thal_SFC_v5_t1~~1*Thal_SFC_v5_t1
Thal_SFC_v6_t1~~1*Thal_SFC_v6_t1

Thal_SFC_v1_t2~~equal("Thal_SFC_v1_t1~~Thal_SFC_v1_t1")*Thal_SFC_v1_t2  
Thal_SFC_v2_t2~~equal("Thal_SFC_v2_t1~~Thal_SFC_v2_t1")*Thal_SFC_v2_t2 
Thal_SFC_v3_t2~~equal("Thal_SFC_v3_t1~~Thal_SFC_v3_t1")*Thal_SFC_v3_t2
Thal_SFC_v4_t2~~equal("Thal_SFC_v4_t1~~Thal_SFC_v4_t1")*Thal_SFC_v4_t2
Thal_SFC_v5_t2~~equal("Thal_SFC_v5_t1~~Thal_SFC_v5_t1")*Thal_SFC_v5_t2  
Thal_SFC_v6_t2~~equal("Thal_SFC_v6_t1~~Thal_SFC_v6_t1")*Thal_SFC_v6_t2 

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.
Thal_SFC_v1_t1~1*0  
Thal_SFC_v2_t1~1*0  
Thal_SFC_v3_t1~1*0 
Thal_SFC_v4_t1~1*0 
Thal_SFC_v5_t1~1*0  
Thal_SFC_v6_t1~1*0  


#########################################
# Dynamic Connectivity
#########################################

DFC_T1=~ Thal_DFC_v5_t1 + Thal_DFC_v6_t1 + Thal_DFC_v7_t1 + Thal_DFC_v8_t1 + Thal_DFC_v9_t1 
DFC_T2=~ equal("DFC_T1=~Thal_DFC_v5_t1")*Thal_DFC_v5_t2+
equal("DFC_T1=~Thal_DFC_v6_t1")*Thal_DFC_v6_t2+
equal("DFC_T1=~Thal_DFC_v7_t1")*Thal_DFC_v7_t2+
equal("DFC_T1=~Thal_DFC_v8_t1")*Thal_DFC_v8_t2+
equal("DFC_T1=~Thal_DFC_v9_t1")*Thal_DFC_v9_t2

DFC_T2 ~ 1*DFC_T1     
dDFC =~ 1*DFC_T2     
DFC_T2 ~ 0*1          
DFC_T2 ~~ 0*DFC_T2    # This fixes the variance of the COG_T2 to 0 

dDFC ~ adfc*medication_binary     # regression
DFC_T1 ~  1            
dDFC ~~  dDFC       # This estimates the variance of the change scores 
DFC_T1 ~~   DFC_T1     
dDFC~DFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables

Thal_DFC_v5_t1~~Thal_DFC_v5_t2 
Thal_DFC_v6_t1~~Thal_DFC_v6_t2 
Thal_DFC_v7_t1~~Thal_DFC_v7_t2 
Thal_DFC_v8_t1~~Thal_DFC_v8_t2 
Thal_DFC_v9_t1~~Thal_DFC_v9_t2 

## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Thal_DFC_v5_t1~~1*Thal_DFC_v5_t1

Thal_DFC_v6_t1~~1*Thal_DFC_v6_t1
Thal_DFC_v7_t1~~1*Thal_DFC_v7_t1
Thal_DFC_v8_t1~~1*Thal_DFC_v8_t1
Thal_DFC_v9_t1~~1*Thal_DFC_v9_t1



Thal_DFC_v5_t2~~equal("Thal_DFC_v5_t1~~Thal_DFC_v5_t1")*Thal_DFC_v5_t2
Thal_DFC_v6_t2~~equal("Thal_DFC_v6_t1~~Thal_DFC_v6_t1")*Thal_DFC_v6_t2
Thal_DFC_v7_t2~~equal("Thal_DFC_v7_t1~~Thal_DFC_v7_t1")*Thal_DFC_v7_t2
Thal_DFC_v8_t2~~equal("Thal_DFC_v8_t1~~Thal_DFC_v8_t1")*Thal_DFC_v8_t2
Thal_DFC_v9_t2~~equal("Thal_DFC_v9_t1~~Thal_DFC_v9_t1")*Thal_DFC_v9_t2

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.

Thal_DFC_v5_t1~1*0 
Thal_DFC_v6_t1~1*0 
Thal_DFC_v7_t1~1*0 
Thal_DFC_v8_t1~1*0 
Thal_DFC_v9_t1~1*0 

#######################################
### CPT/Clinical Meausres
#######################################

EmoLia_t2 ~ 1*EmoLia_t1     
dEL =~ 1*EmoLia_t2  
EmoLia_t2 ~ 0*1          
EmoLia_t2 ~~ 0*EmoLia_t2     

dEL ~ cEL*medication_binary +bsEL*dSFC +bdEL*dDFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +bsIA*dSFC +bdIA*dDFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +bsHA*dSFC +bdHA*dDFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
abEL1:=asfc*bsEL
abEL2:=adfc*bdEL
totalEL:=cEL + abEL1 + abEL2
permedabEL1:=abEL1/totalEL
permedabEL2:=abEL2/totalEL


abIA1:=asfc*bsIA
abIA2:=adfc*bdIA
totalIA:=cIA + abIA1 + abIA2
permedabIA1:=abIA1/totalIA
permedabIA2:=abIA2/totalIA

abHA1:=asfc*bsHA
abHA2:=adfc*bdHA
totalHA:=cHA + abHA1 + abHA2
permedabHA1:=abHA1/totalHA
permedabHA2:=abHA2/totalHA
'


model.thalamus.dfc='
## Resting state static/dynamic functional connectivity measures

#########################################
# Dynamic Connectivity
#########################################

DFC_T1=~ Thal_DFC_v5_t1 + Thal_DFC_v6_t1 + Thal_DFC_v7_t1 + Thal_DFC_v8_t1 + Thal_DFC_v9_t1 
DFC_T2=~ equal("DFC_T1=~Thal_DFC_v5_t1")*Thal_DFC_v5_t2+
equal("DFC_T1=~Thal_DFC_v6_t1")*Thal_DFC_v6_t2+
equal("DFC_T1=~Thal_DFC_v7_t1")*Thal_DFC_v7_t2+
equal("DFC_T1=~Thal_DFC_v8_t1")*Thal_DFC_v8_t2+
equal("DFC_T1=~Thal_DFC_v9_t1")*Thal_DFC_v9_t2

DFC_T2 ~ 1*DFC_T1     
dDFC =~ 1*DFC_T2     
DFC_T2 ~ 0*1          
DFC_T2 ~~ 0*DFC_T2    # This fixes the variance of the COG_T2 to 0 

dDFC ~ adfc*medication_binary     # regression
DFC_T1 ~  1            
dDFC ~~  dDFC       # This estimates the variance of the change scores 
DFC_T1 ~~   DFC_T1     
dDFC~DFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables

Thal_DFC_v5_t1~~Thal_DFC_v5_t2 
Thal_DFC_v6_t1~~Thal_DFC_v6_t2 
Thal_DFC_v7_t1~~Thal_DFC_v7_t2 
Thal_DFC_v8_t1~~Thal_DFC_v8_t2 
Thal_DFC_v9_t1~~Thal_DFC_v9_t2 

## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Thal_DFC_v5_t1~~1*Thal_DFC_v5_t1

Thal_DFC_v6_t1~~1*Thal_DFC_v6_t1
Thal_DFC_v7_t1~~1*Thal_DFC_v7_t1
Thal_DFC_v8_t1~~1*Thal_DFC_v8_t1
Thal_DFC_v9_t1~~1*Thal_DFC_v9_t1

Thal_DFC_v5_t2~~equal("Thal_DFC_v5_t1~~Thal_DFC_v5_t1")*Thal_DFC_v5_t2
Thal_DFC_v6_t2~~equal("Thal_DFC_v6_t1~~Thal_DFC_v6_t1")*Thal_DFC_v6_t2
Thal_DFC_v7_t2~~equal("Thal_DFC_v7_t1~~Thal_DFC_v7_t1")*Thal_DFC_v7_t2
Thal_DFC_v8_t2~~equal("Thal_DFC_v8_t1~~Thal_DFC_v8_t1")*Thal_DFC_v8_t2
Thal_DFC_v9_t2~~equal("Thal_DFC_v9_t1~~Thal_DFC_v9_t1")*Thal_DFC_v9_t2

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.

Thal_DFC_v5_t1~1*0 
Thal_DFC_v6_t1~1*0 
Thal_DFC_v7_t1~1*0 
Thal_DFC_v8_t1~1*0 
Thal_DFC_v9_t1~1*0 

#######################################
### CPT/Clinical Meausres
#######################################

EmoLia_t2 ~ 1*EmoLia_t1     
dEL =~ 1*EmoLia_t2  
EmoLia_t2 ~ 0*1          
EmoLia_t2 ~~ 0*EmoLia_t2     

dEL ~ cEL*medication_binary  +bdEL*dDFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +bdIA*dDFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +bdHA*dDFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
abEL2:=adfc*bdEL
totalEL:=cEL + abEL2
permedabEL2:=abEL2/totalEL

abIA2:=adfc*bdIA
totalIA:= cIA + abIA2
permedabIA2:=abIA2/totalIA

abHA2:=adfc*bdHA
totalHA:=cHA + abHA2
permedabHA2:=abHA2/totalHA
'

model.thalamus.sfc='
## Resting state static/dynamic functional connectivity measures

#########################################
# Static Connectivity
#########################################
SFC_T1=~Thal_SFC_v1_t1 + Thal_SFC_v2_t1 + Thal_SFC_v3_t1 + Thal_SFC_v4_t1 + Thal_SFC_v5_t1 + Thal_SFC_v6_t1 
# This specifies the measurement model for Attention at baseline
SFC_T2=~equal("SFC_T1=~Thal_SFC_v1_t1")*Thal_SFC_v1_t2+
equal("SFC_T1=~Thal_SFC_v2_t1")*Thal_SFC_v2_t2+
equal("SFC_T1=~Thal_SFC_v3_t1")*Thal_SFC_v3_t2+
equal("SFC_T1=~Thal_SFC_v4_t1")*Thal_SFC_v4_t2+
equal("SFC_T1=~Thal_SFC_v5_t1")*Thal_SFC_v5_t2+
equal("SFC_T1=~Thal_SFC_v6_t1")*Thal_SFC_v6_t2

SFC_T2 ~ 1*SFC_T1     
dSFC =~ 1*SFC_T2     
SFC_T2 ~ 0*1          
SFC_T2 ~~ 0*SFC_T2    # This fixes the variance of the COG_T2 to 0 

dSFC ~ asfc*medication_binary     # regression
SFC_T1 ~  1            
dSFC ~~  dSFC       # This estimates the variance of the change scores 
SFC_T1 ~~   SFC_T1     
dSFC~SFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables
Thal_SFC_v1_t1~~Thal_SFC_v1_t2  
Thal_SFC_v2_t1~~Thal_SFC_v2_t2 
Thal_SFC_v3_t1~~Thal_SFC_v3_t2 
Thal_SFC_v4_t1~~Thal_SFC_v4_t2 
Thal_SFC_v5_t1~~Thal_SFC_v5_t2 
Thal_SFC_v6_t1~~Thal_SFC_v6_t2 


## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Thal_SFC_v1_t1~~1*Thal_SFC_v1_t1  
Thal_SFC_v2_t1~~1*Thal_SFC_v2_t1 
Thal_SFC_v3_t1~~1*Thal_SFC_v3_t1
Thal_SFC_v4_t1~~1*Thal_SFC_v4_t1
Thal_SFC_v5_t1~~1*Thal_SFC_v5_t1
Thal_SFC_v6_t1~~1*Thal_SFC_v6_t1

Thal_SFC_v1_t2~~equal("Thal_SFC_v1_t1~~Thal_SFC_v1_t1")*Thal_SFC_v1_t2  
Thal_SFC_v2_t2~~equal("Thal_SFC_v2_t1~~Thal_SFC_v2_t1")*Thal_SFC_v2_t2 
Thal_SFC_v3_t2~~equal("Thal_SFC_v3_t1~~Thal_SFC_v3_t1")*Thal_SFC_v3_t2
Thal_SFC_v4_t2~~equal("Thal_SFC_v4_t1~~Thal_SFC_v4_t1")*Thal_SFC_v4_t2
Thal_SFC_v5_t2~~equal("Thal_SFC_v5_t1~~Thal_SFC_v5_t1")*Thal_SFC_v5_t2  
Thal_SFC_v6_t2~~equal("Thal_SFC_v6_t1~~Thal_SFC_v6_t1")*Thal_SFC_v6_t2 

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.
Thal_SFC_v1_t1~1*0  
Thal_SFC_v2_t1~1*0  
Thal_SFC_v3_t1~1*0 
Thal_SFC_v4_t1~1*0 
Thal_SFC_v5_t1~1*0  
Thal_SFC_v6_t1~1*0  

#######################################
### CPT/Clinical Meausres
#######################################

EmoLia_t2 ~ 1*EmoLia_t1     
dEL =~ 1*EmoLia_t2  
EmoLia_t2 ~ 0*1          
EmoLia_t2 ~~ 0*EmoLia_t2     

dEL ~ cEL*medication_binary +bsEL*dSFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +bsIA*dSFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +bsHA*dSFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
abEL1:=asfc*bsEL
totalEL:=cEL + abEL1
permedabEL1:=abEL1/totalEL

abIA1:=asfc*bsIA
totalIA:=cIA + abIA1
permedabIA1:=abIA1/totalIA

abHA1:=asfc*bsHA
totalHA:=cHA + abHA1
permedabHA1:=abHA1/totalHA
'

## 1.B. Striatum

model.striatum='
## Resting state static/dynamic functional connectivity measures

#########################################
# Static Connectivity
#########################################
SFC_T1=~Stra_SFC_v1_t1 + Stra_SFC_v2_t1 + Stra_SFC_v3_t1 + Stra_SFC_v4_t1 + Stra_SFC_v5_t1 + Stra_SFC_v6_t1 + Stra_SFC_v7_t1 + Stra_SFC_v8_t1 + Stra_SFC_v9_t1 + Stra_SFC_v10_t1 + Stra_SFC_v11_t1+ Stra_SFC_v12_t1+ Stra_SFC_v13_t1+ Stra_SFC_v14_t1
# This specifies the measurement model for Attention at baseline
SFC_T2=~equal("SFC_T1=~Stra_SFC_v1_t1")*Stra_SFC_v1_t2+
equal("SFC_T1=~Stra_SFC_v2_t1")*Stra_SFC_v2_t2+
equal("SFC_T1=~Stra_SFC_v3_t1")*Stra_SFC_v3_t2+
equal("SFC_T1=~Stra_SFC_v4_t1")*Stra_SFC_v4_t2+
equal("SFC_T1=~Stra_SFC_v5_t1")*Stra_SFC_v5_t2+
equal("SFC_T1=~Stra_SFC_v6_t1")*Stra_SFC_v6_t2+
equal("SFC_T1=~Stra_SFC_v7_t1")*Stra_SFC_v7_t2+
equal("SFC_T1=~Stra_SFC_v8_t1")*Stra_SFC_v8_t2+
equal("SFC_T1=~Stra_SFC_v9_t1")*Stra_SFC_v9_t2+
equal("SFC_T1=~Stra_SFC_v10_t1")*Stra_SFC_v10_t2
+
equal("SFC_T1=~Stra_SFC_v11_t1")*Stra_SFC_v11_t2+
equal("SFC_T1=~Stra_SFC_v12_t1")*Stra_SFC_v12_t2+
equal("SFC_T1=~Stra_SFC_v13_t1")*Stra_SFC_v13_t2+
equal("SFC_T1=~Stra_SFC_v14_t1")*Stra_SFC_v14_t2


SFC_T2 ~ 1*SFC_T1     
dSFC =~ 1*SFC_T2     
SFC_T2 ~ 0*1          
SFC_T2 ~~ 0*SFC_T2    # This fixes the variance of the COG_T2 to 0 

dSFC ~ asfc*medication_binary     # regression
SFC_T1 ~  1            
dSFC ~~  dSFC       # This estimates the variance of the change scores 
SFC_T1 ~~   SFC_T1     
dSFC~SFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables
Stra_SFC_v1_t1~~Stra_SFC_v1_t2  
Stra_SFC_v2_t1~~Stra_SFC_v2_t2 
Stra_SFC_v3_t1~~Stra_SFC_v3_t2 
Stra_SFC_v4_t1~~Stra_SFC_v4_t2 
Stra_SFC_v5_t1~~Stra_SFC_v5_t2 
Stra_SFC_v6_t1~~Stra_SFC_v6_t2 
Stra_SFC_v7_t1~~Stra_SFC_v7_t2 
Stra_SFC_v8_t1~~Stra_SFC_v8_t2 
Stra_SFC_v9_t1~~Stra_SFC_v9_t2 
Stra_SFC_v10_t1~~Stra_SFC_v10_t2 
Stra_SFC_v11_t1~~Stra_SFC_v11_t2
Stra_SFC_v12_t1~~Stra_SFC_v12_t2
Stra_SFC_v13_t1~~Stra_SFC_v13_t2
Stra_SFC_v14_t1~~Stra_SFC_v14_t2

## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Stra_SFC_v1_t1~~1*Stra_SFC_v1_t1  
Stra_SFC_v2_t1~~1*Stra_SFC_v2_t1 
Stra_SFC_v3_t1~~1*Stra_SFC_v3_t1
Stra_SFC_v4_t1~~1*Stra_SFC_v4_t1
Stra_SFC_v5_t1~~1*Stra_SFC_v5_t1
Stra_SFC_v6_t1~~1*Stra_SFC_v6_t1
Stra_SFC_v7_t1~~1*Stra_SFC_v7_t1
Stra_SFC_v8_t1~~1*Stra_SFC_v8_t1
Stra_SFC_v9_t1~~1*Stra_SFC_v9_t1
Stra_SFC_v10_t1~~1*Stra_SFC_v10_t1
Stra_SFC_v11_t1~~1*Stra_SFC_v11_t1
Stra_SFC_v12_t1~~1*Stra_SFC_v12_t1
Stra_SFC_v13_t1~~1*Stra_SFC_v13_t1
Stra_SFC_v14_t1~~1*Stra_SFC_v14_t1


Stra_SFC_v1_t2~~equal("Stra_SFC_v1_t1~~Stra_SFC_v1_t1")*Stra_SFC_v1_t2  
Stra_SFC_v2_t2~~equal("Stra_SFC_v2_t1~~Stra_SFC_v2_t1")*Stra_SFC_v2_t2 
Stra_SFC_v3_t2~~equal("Stra_SFC_v3_t1~~Stra_SFC_v3_t1")*Stra_SFC_v3_t2
Stra_SFC_v4_t2~~equal("Stra_SFC_v4_t1~~Stra_SFC_v4_t1")*Stra_SFC_v4_t2
Stra_SFC_v5_t2~~equal("Stra_SFC_v5_t1~~Stra_SFC_v5_t1")*Stra_SFC_v5_t2  
Stra_SFC_v6_t2~~equal("Stra_SFC_v6_t1~~Stra_SFC_v6_t1")*Stra_SFC_v6_t2 
Stra_SFC_v7_t2~~equal("Stra_SFC_v7_t1~~Stra_SFC_v7_t1")*Stra_SFC_v7_t2
Stra_SFC_v8_t2~~equal("Stra_SFC_v8_t1~~Stra_SFC_v8_t1")*Stra_SFC_v8_t2
Stra_SFC_v9_t2~~equal("Stra_SFC_v9_t1~~Stra_SFC_v9_t1")*Stra_SFC_v9_t2  
Stra_SFC_v10_t2~~equal("Stra_SFC_v10_t1~~Stra_SFC_v10_t1")*Stra_SFC_v10_t2 
Stra_SFC_v11_t2~~equal("Stra_SFC_v11_t1~~Stra_SFC_v11_t1")*Stra_SFC_v11_t2
Stra_SFC_v12_t2~~equal("Stra_SFC_v12_t1~~Stra_SFC_v12_t1")*Stra_SFC_v12_t2
Stra_SFC_v13_t2~~equal("Stra_SFC_v13_t1~~Stra_SFC_v13_t1")*Stra_SFC_v13_t2
Stra_SFC_v14_t2~~equal("Stra_SFC_v14_t1~~Stra_SFC_v14_t1")*Stra_SFC_v14_t2

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.
Stra_SFC_v1_t1~1*0  
Stra_SFC_v2_t1~1*0  
Stra_SFC_v3_t1~1*0
Stra_SFC_v4_t1~1*0 
Stra_SFC_v5_t1~1*0  
Stra_SFC_v6_t1~1*0  
Stra_SFC_v7_t1~1*0 
Stra_SFC_v8_t1~1*0
Stra_SFC_v9_t1~1*0  
Stra_SFC_v10_t1~1*0 
Stra_SFC_v11_t1~1*0
Stra_SFC_v12_t1~1*0
Stra_SFC_v13_t1~1*0
Stra_SFC_v14_t1~1*0

#########################################
# Dynamic Connectivity
#########################################

DFC_T1=~Stra_DFC_v1_t1 + Stra_DFC_v2_t1 + Stra_DFC_v3_t1 + Stra_DFC_v4_t1  
DFC_T2=~equal("DFC_T1=~Stra_DFC_v1_t1")*Stra_DFC_v1_t2+
equal("DFC_T1=~Stra_DFC_v2_t1")*Stra_DFC_v2_t2+
equal("DFC_T1=~Stra_DFC_v3_t1")*Stra_DFC_v3_t2+
equal("DFC_T1=~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

DFC_T2 ~ 1*DFC_T1     
dDFC =~ 1*DFC_T2     
DFC_T2 ~ 0*1          
DFC_T2 ~~ 0*DFC_T2    # This fixes the variance of the COG_T2 to 0 

dDFC ~ adfc*medication_binary  # regression
DFC_T1 ~  1            
dDFC ~~  dDFC       # This estimates the variance of the change scores 
DFC_T1 ~~   DFC_T1     
dDFC~DFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables
Stra_DFC_v1_t1~~Stra_DFC_v1_t2  
Stra_DFC_v2_t1~~Stra_DFC_v2_t2 
Stra_DFC_v3_t1~~Stra_DFC_v3_t2 
Stra_DFC_v4_t1~~Stra_DFC_v4_t2 

## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Stra_DFC_v1_t1~~1*Stra_DFC_v1_t1  
Stra_DFC_v2_t1~~1*Stra_DFC_v2_t1 
Stra_DFC_v3_t1~~1*Stra_DFC_v3_t1
Stra_DFC_v4_t1~~1*Stra_DFC_v4_t1

Stra_DFC_v1_t2~~equal("Stra_DFC_v1_t1~~Stra_DFC_v1_t1")*Stra_DFC_v1_t2  
Stra_DFC_v2_t2~~equal("Stra_DFC_v2_t1~~Stra_DFC_v2_t1")*Stra_DFC_v2_t2 
Stra_DFC_v3_t2~~equal("Stra_DFC_v3_t1~~Stra_DFC_v3_t1")*Stra_DFC_v3_t2
Stra_DFC_v4_t2~~equal("Stra_DFC_v4_t1~~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.
Stra_DFC_v1_t1~1*0  
Stra_DFC_v2_t1~1*0  
Stra_DFC_v3_t1~1*0 
Stra_DFC_v4_t1~1*0 

#######################################
### CPT/Clinical Meausres
#######################################

EmoLia_t2 ~ 1*EmoLia_t1     
dEL =~ 1*EmoLia_t2  
EmoLia_t2 ~ 0*1          
EmoLia_t2 ~~ 0*EmoLia_t2     

dEL ~ cEL*medication_binary +bsEL*dSFC +bdEL*dDFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +bsIA*dSFC +bdIA*dDFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +bsHA*dSFC +bdHA*dDFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
abEL1:=asfc*bsEL
abEL2:=adfc*bdEL
totalEL:=cEL + abEL1 + abEL2
permedabEL1:=abEL1/totalEL
permedabEL2:=abEL2/totalEL

abIA1:=asfc*bsIA
abIA2:=adfc*bdIA
totalIA:=cIA + abIA1 + abIA2
permedabIA1:=abIA1/totalIA
permedabIA2:=abIA2/totalIA

abHA1:=asfc*bsHA
abHA2:=adfc*bdHA
totalHA:=cHA + abHA1 + abHA2
permedabHA1:=abHA1/totalHA
permedabHA2:=abHA2/totalHA
'

model.striatum.dfc='
## Resting state static/dynamic functional connectivity measures
#########################################
# Dynamic Connectivity
#########################################

DFC_T1=~Stra_DFC_v1_t1 + Stra_DFC_v2_t1 + Stra_DFC_v3_t1 + Stra_DFC_v4_t1  
DFC_T2=~equal("DFC_T1=~Stra_DFC_v1_t1")*Stra_DFC_v1_t2+
equal("DFC_T1=~Stra_DFC_v2_t1")*Stra_DFC_v2_t2+
equal("DFC_T1=~Stra_DFC_v3_t1")*Stra_DFC_v3_t2+
equal("DFC_T1=~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

DFC_T2 ~ 1*DFC_T1     
dDFC =~ 1*DFC_T2     
DFC_T2 ~ 0*1          
DFC_T2 ~~ 0*DFC_T2    # This fixes the variance of the COG_T2 to 0 

dDFC ~ adfc*medication_binary  # regression
DFC_T1 ~  1            
dDFC ~~  dDFC       # This estimates the variance of the change scores 
DFC_T1 ~~   DFC_T1     
dDFC~DFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables
Stra_DFC_v1_t1~~Stra_DFC_v1_t2  
Stra_DFC_v2_t1~~Stra_DFC_v2_t2 
Stra_DFC_v3_t1~~Stra_DFC_v3_t2 
Stra_DFC_v4_t1~~Stra_DFC_v4_t2 

## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Stra_DFC_v1_t1~~1*Stra_DFC_v1_t1  
Stra_DFC_v2_t1~~1*Stra_DFC_v2_t1 
Stra_DFC_v3_t1~~1*Stra_DFC_v3_t1
Stra_DFC_v4_t1~~1*Stra_DFC_v4_t1

Stra_DFC_v1_t2~~equal("Stra_DFC_v1_t1~~Stra_DFC_v1_t1")*Stra_DFC_v1_t2  
Stra_DFC_v2_t2~~equal("Stra_DFC_v2_t1~~Stra_DFC_v2_t1")*Stra_DFC_v2_t2 
Stra_DFC_v3_t2~~equal("Stra_DFC_v3_t1~~Stra_DFC_v3_t1")*Stra_DFC_v3_t2
Stra_DFC_v4_t2~~equal("Stra_DFC_v4_t1~~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.
Stra_DFC_v1_t1~1*0  
Stra_DFC_v2_t1~1*0  
Stra_DFC_v3_t1~1*0 
Stra_DFC_v4_t1~1*0 

#######################################
### CPT/Clinical Meausres
#######################################

EmoLia_t2 ~ 1*EmoLia_t1     
dEL =~ 1*EmoLia_t2  
EmoLia_t2 ~ 0*1          
EmoLia_t2 ~~ 0*EmoLia_t2     

dEL ~ cEL*medication_binary  +bdEL*dDFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +bdIA*dDFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary  +bdHA*dDFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
abEL2:=adfc*bdEL
totalEL:=cEL  + abEL2
permedabEL2:=abEL2/totalEL

abIA2:=adfc*bdIA
totalIA:=cIA  + abIA2
permedabIA2:=abIA2/totalIA

abHA2:=adfc*bdHA
totalHA:=cHA +  abHA2
permedabHA2:=abHA2/totalHA
'

model.striatum.sfc='
## Resting state static/dynamic functional connectivity measures

#########################################
# Static Connectivity
#########################################
SFC_T1=~Stra_SFC_v1_t1 + Stra_SFC_v2_t1 + Stra_SFC_v3_t1 + Stra_SFC_v4_t1 + Stra_SFC_v5_t1 + Stra_SFC_v6_t1 + Stra_SFC_v7_t1 + Stra_SFC_v8_t1 + Stra_SFC_v9_t1 + Stra_SFC_v10_t1 + Stra_SFC_v11_t1+ Stra_SFC_v12_t1+ Stra_SFC_v13_t1+ Stra_SFC_v14_t1
# This specifies the measurement model for Attention at baseline
SFC_T2=~equal("SFC_T1=~Stra_SFC_v1_t1")*Stra_SFC_v1_t2+
equal("SFC_T1=~Stra_SFC_v2_t1")*Stra_SFC_v2_t2+
equal("SFC_T1=~Stra_SFC_v3_t1")*Stra_SFC_v3_t2+
equal("SFC_T1=~Stra_SFC_v4_t1")*Stra_SFC_v4_t2+
equal("SFC_T1=~Stra_SFC_v5_t1")*Stra_SFC_v5_t2+
equal("SFC_T1=~Stra_SFC_v6_t1")*Stra_SFC_v6_t2+
equal("SFC_T1=~Stra_SFC_v7_t1")*Stra_SFC_v7_t2+
equal("SFC_T1=~Stra_SFC_v8_t1")*Stra_SFC_v8_t2+
equal("SFC_T1=~Stra_SFC_v9_t1")*Stra_SFC_v9_t2+
equal("SFC_T1=~Stra_SFC_v10_t1")*Stra_SFC_v10_t2
+
equal("SFC_T1=~Stra_SFC_v11_t1")*Stra_SFC_v11_t2+
equal("SFC_T1=~Stra_SFC_v12_t1")*Stra_SFC_v12_t2+
equal("SFC_T1=~Stra_SFC_v13_t1")*Stra_SFC_v13_t2+
equal("SFC_T1=~Stra_SFC_v14_t1")*Stra_SFC_v14_t2


SFC_T2 ~ 1*SFC_T1     
dSFC =~ 1*SFC_T2     
SFC_T2 ~ 0*1          
SFC_T2 ~~ 0*SFC_T2    # This fixes the variance of the COG_T2 to 0 

dSFC ~ asfc*medication_binary     # regression
SFC_T1 ~  1            
dSFC ~~  dSFC       # This estimates the variance of the change scores 
SFC_T1 ~~   SFC_T1     
dSFC~SFC_T1          # This estimates the self-feedback parameter

## Allow correlation between pre-post observed variables
Stra_SFC_v1_t1~~Stra_SFC_v1_t2  
Stra_SFC_v2_t1~~Stra_SFC_v2_t2 
Stra_SFC_v3_t1~~Stra_SFC_v3_t2 
Stra_SFC_v4_t1~~Stra_SFC_v4_t2 
Stra_SFC_v5_t1~~Stra_SFC_v5_t2 
Stra_SFC_v6_t1~~Stra_SFC_v6_t2 
Stra_SFC_v7_t1~~Stra_SFC_v7_t2 
Stra_SFC_v8_t1~~Stra_SFC_v8_t2 
Stra_SFC_v9_t1~~Stra_SFC_v9_t2 
Stra_SFC_v10_t1~~Stra_SFC_v10_t2 
Stra_SFC_v11_t1~~Stra_SFC_v11_t2
Stra_SFC_v12_t1~~Stra_SFC_v12_t2
Stra_SFC_v13_t1~~Stra_SFC_v13_t2
Stra_SFC_v14_t1~~Stra_SFC_v14_t2

## Errors of the Oberservations are same across pre-post. Since they are standardized, we set as 1.
Stra_SFC_v1_t1~~1*Stra_SFC_v1_t1  
Stra_SFC_v2_t1~~1*Stra_SFC_v2_t1 
Stra_SFC_v3_t1~~1*Stra_SFC_v3_t1
Stra_SFC_v4_t1~~1*Stra_SFC_v4_t1
Stra_SFC_v5_t1~~1*Stra_SFC_v5_t1
Stra_SFC_v6_t1~~1*Stra_SFC_v6_t1
Stra_SFC_v7_t1~~1*Stra_SFC_v7_t1
Stra_SFC_v8_t1~~1*Stra_SFC_v8_t1
Stra_SFC_v9_t1~~1*Stra_SFC_v9_t1
Stra_SFC_v10_t1~~1*Stra_SFC_v10_t1
Stra_SFC_v11_t1~~1*Stra_SFC_v11_t1
Stra_SFC_v12_t1~~1*Stra_SFC_v12_t1
Stra_SFC_v13_t1~~1*Stra_SFC_v13_t1
Stra_SFC_v14_t1~~1*Stra_SFC_v14_t1


Stra_SFC_v1_t2~~equal("Stra_SFC_v1_t1~~Stra_SFC_v1_t1")*Stra_SFC_v1_t2  
Stra_SFC_v2_t2~~equal("Stra_SFC_v2_t1~~Stra_SFC_v2_t1")*Stra_SFC_v2_t2 
Stra_SFC_v3_t2~~equal("Stra_SFC_v3_t1~~Stra_SFC_v3_t1")*Stra_SFC_v3_t2
Stra_SFC_v4_t2~~equal("Stra_SFC_v4_t1~~Stra_SFC_v4_t1")*Stra_SFC_v4_t2
Stra_SFC_v5_t2~~equal("Stra_SFC_v5_t1~~Stra_SFC_v5_t1")*Stra_SFC_v5_t2  
Stra_SFC_v6_t2~~equal("Stra_SFC_v6_t1~~Stra_SFC_v6_t1")*Stra_SFC_v6_t2 
Stra_SFC_v7_t2~~equal("Stra_SFC_v7_t1~~Stra_SFC_v7_t1")*Stra_SFC_v7_t2
Stra_SFC_v8_t2~~equal("Stra_SFC_v8_t1~~Stra_SFC_v8_t1")*Stra_SFC_v8_t2
Stra_SFC_v9_t2~~equal("Stra_SFC_v9_t1~~Stra_SFC_v9_t1")*Stra_SFC_v9_t2  
Stra_SFC_v10_t2~~equal("Stra_SFC_v10_t1~~Stra_SFC_v10_t1")*Stra_SFC_v10_t2 
Stra_SFC_v11_t2~~equal("Stra_SFC_v11_t1~~Stra_SFC_v11_t1")*Stra_SFC_v11_t2
Stra_SFC_v12_t2~~equal("Stra_SFC_v12_t1~~Stra_SFC_v12_t1")*Stra_SFC_v12_t2
Stra_SFC_v13_t2~~equal("Stra_SFC_v13_t1~~Stra_SFC_v13_t1")*Stra_SFC_v13_t2
Stra_SFC_v14_t2~~equal("Stra_SFC_v14_t1~~Stra_SFC_v14_t1")*Stra_SFC_v14_t2

## Intercepts of the Oberservations are fixed as zero, and we will standardize all inputs.
Stra_SFC_v1_t1~1*0  
Stra_SFC_v2_t1~1*0  
Stra_SFC_v3_t1~1*0
Stra_SFC_v4_t1~1*0 
Stra_SFC_v5_t1~1*0  
Stra_SFC_v6_t1~1*0  
Stra_SFC_v7_t1~1*0 
Stra_SFC_v8_t1~1*0
Stra_SFC_v9_t1~1*0  
Stra_SFC_v10_t1~1*0 
Stra_SFC_v11_t1~1*0
Stra_SFC_v12_t1~1*0
Stra_SFC_v13_t1~1*0
Stra_SFC_v14_t1~1*0

#######################################
### CPT/Clinical Meausres
#######################################

EmoLia_t2 ~ 1*EmoLia_t1     
dEL =~ 1*EmoLia_t2  
EmoLia_t2 ~ 0*1          
EmoLia_t2 ~~ 0*EmoLia_t2     

dEL ~ cEL*medication_binary +bsEL*dSFC      # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +bsIA*dSFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +bsHA*dSFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
abEL1:=asfc*bsEL
totalEL:=cEL + abEL1
permedabEL1:=abEL1/totalEL

abIA1:=asfc*bsIA
totalIA:=cIA + abIA1
permedabIA1:=abIA1/totalIA

abHA1:=asfc*bsHA
totalHA:=cHA + abHA1 
permedabHA1:=abHA1/totalHA
'