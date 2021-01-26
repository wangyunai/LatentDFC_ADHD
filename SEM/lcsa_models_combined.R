##############################################
### Thalamus and Striatum Combined Analysis
##############################################

# 1. 3 factor model 

model.st.3factor='
## Resting state static/dynamic functional connectivity measures

#########################################
# Static Connectivity - THalamus
#########################################
Tha_SFC_T1=~Thal_SFC_v1_t1 + Thal_SFC_v2_t1 + Thal_SFC_v3_t1 + Thal_SFC_v4_t1 + Thal_SFC_v5_t1 + Thal_SFC_v6_t1 
# This specifies the measurement model for Attention at baseline
Tha_SFC_T2=~equal("SFC_T1=~Thal_SFC_v1_t1")*Thal_SFC_v1_t2+
equal("SFC_T1=~Thal_SFC_v2_t1")*Thal_SFC_v2_t2+
equal("SFC_T1=~Thal_SFC_v3_t1")*Thal_SFC_v3_t2+
equal("SFC_T1=~Thal_SFC_v4_t1")*Thal_SFC_v4_t2+
equal("SFC_T1=~Thal_SFC_v5_t1")*Thal_SFC_v5_t2+
equal("SFC_T1=~Thal_SFC_v6_t1")*Thal_SFC_v6_t2

Tha_SFC_T2 ~ 1*Tha_SFC_T1     
Tha_dSFC =~ 1*Tha_SFC_T2     
Tha_SFC_T2 ~ 0*1          
Tha_SFC_T2 ~~ 0*Tha_SFC_T2    # This fixes the variance of the COG_T2 to 0 

Tha_dSFC ~ t_asfc*medication_binary     # regression
Tha_SFC_T1 ~  1            
Tha_dSFC ~~  Tha_dSFC       # This estimates the variance of the change scores 
Tha_SFC_T1 ~~   Tha_SFC_T1     
Tha_dSFC~Tha_SFC_T1          # This estimates the self-feedback parameter

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
# Static Connectivity - Striatum
#########################################
Str_SFC_T1=~Stra_SFC_v1_t1 + Stra_SFC_v2_t1 + Stra_SFC_v3_t1 + Stra_SFC_v4_t1 + Stra_SFC_v5_t1 + Stra_SFC_v6_t1 + Stra_SFC_v7_t1 + Stra_SFC_v8_t1 + Stra_SFC_v9_t1 + Stra_SFC_v10_t1 + Stra_SFC_v11_t1+ Stra_SFC_v12_t1+ Stra_SFC_v13_t1+ Stra_SFC_v14_t1
# This specifies the measurement model for Attention at baseline
Str_SFC_T2=~equal("SFC_T1=~Stra_SFC_v1_t1")*Stra_SFC_v1_t2+
equal("SFC_T1=~Stra_SFC_v2_t1")*Stra_SFC_v2_t2+
equal("SFC_T1=~Stra_SFC_v3_t1")*Stra_SFC_v3_t2+
equal("SFC_T1=~Stra_SFC_v4_t1")*Stra_SFC_v4_t2+
equal("SFC_T1=~Stra_SFC_v5_t1")*Stra_SFC_v5_t2+
equal("SFC_T1=~Stra_SFC_v6_t1")*Stra_SFC_v6_t2+
equal("SFC_T1=~Stra_SFC_v7_t1")*Stra_SFC_v7_t2+
equal("SFC_T1=~Stra_SFC_v8_t1")*Stra_SFC_v8_t2+
equal("SFC_T1=~Stra_SFC_v9_t1")*Stra_SFC_v9_t2+
equal("SFC_T1=~Stra_SFC_v10_t1")*Stra_SFC_v10_t2+
equal("SFC_T1=~Stra_SFC_v11_t1")*Stra_SFC_v11_t2+
equal("SFC_T1=~Stra_SFC_v12_t1")*Stra_SFC_v12_t2+
equal("SFC_T1=~Stra_SFC_v13_t1")*Stra_SFC_v13_t2+
equal("SFC_T1=~Stra_SFC_v14_t1")*Stra_SFC_v14_t2


Str_SFC_T2 ~ 1*Str_SFC_T1     
Str_dSFC =~ 1*Str_SFC_T2     
Str_SFC_T2 ~ 0*1          
Str_SFC_T2 ~~ 0*Str_SFC_T2    # This fixes the variance of the COG_T2 to 0 

Str_dSFC ~ s_asfc*medication_binary     # regression
Str_SFC_T1 ~  1            
Str_dSFC ~~  Str_dSFC       # This estimates the variance of the change scores 
Str_SFC_T1 ~~   Str_SFC_T1     
Str_dSFC~Str_SFC_T1          # This estimates the self-feedback parameter

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
# Dynamic Connectivity (combined)
#########################################
DFC_T1=~ Thal_DFC_v5_t1 + Thal_DFC_v6_t1 + Thal_DFC_v7_t1 + Thal_DFC_v8_t1 + Thal_DFC_v9_t1 +
Stra_DFC_v1_t1 + Stra_DFC_v2_t1 + Stra_DFC_v3_t1 + Stra_DFC_v4_t1  
DFC_T2=~ equal("DFC_T1=~Thal_DFC_v5_t1")*Thal_DFC_v5_t2+
equal("DFC_T1=~Thal_DFC_v6_t1")*Thal_DFC_v6_t2+
equal("DFC_T1=~Thal_DFC_v7_t1")*Thal_DFC_v7_t2+
equal("DFC_T1=~Thal_DFC_v8_t1")*Thal_DFC_v8_t2+
equal("DFC_T1=~Thal_DFC_v9_t1")*Thal_DFC_v9_t2+
equal("DFC_T1=~Stra_DFC_v1_t1")*Stra_DFC_v1_t2+
equal("DFC_T1=~Stra_DFC_v2_t1")*Stra_DFC_v2_t2+
equal("DFC_T1=~Stra_DFC_v3_t1")*Stra_DFC_v3_t2+
equal("DFC_T1=~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

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

#########################################
# Dynamic Connectivity
#########################################

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

dEL ~ cEL*medication_binary +t_bsEL*Tha_dSFC+ s_bsEL*Str_dSFC +bdEL*dDFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +t_bsIA*Tha_dSFC + s_bsIA*Str_dSFC +bdIA*dDFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +t_bsHA*Tha_dSFC +s_bsHA*Str_dSFC+bdHA*dDFC     # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
t_abEL1:=t_asfc*t_bsEL
s_abEL1:=s_asfc*s_bsEL
abEL2:=adfc*bdEL

totalEL:=cEL + t_abEL1 + s_abEL1 + abEL2
t_permedabEL1:=t_abEL1/totalEL
s_permedabEL1:=s_abEL1/totalEL
permedabEL2:=abEL2/totalEL

t_abIA1:=t_asfc*t_bsIA
s_abIA1:=s_asfc*s_bsIA
abIA2:=adfc*bdIA
totalIA:=cIA + t_abIA1 + s_abIA1 + abIA2
t_permedabIA1:=t_abIA1/totalIA
s_permedabIA1:=s_abIA1/totalIA
permedabIA2:=abIA2/totalIA

t_abHA1:=t_asfc*t_bsHA
s_abHA1:=s_asfc*s_bsHA
abHA2:=adfc*bdHA
totalHA:=cHA + t_abHA1 + s_abHA1 + abHA2
t_permedabHA1:=t_abHA1/totalHA
s_permedabHA1:=s_abHA1/totalHA
permedabHA2:=abHA2/totalHA
'

# 2. Only DFC combined

model.st.dfc ='
## Resting state static/dynamic functional connectivity measures
#########################################
# Dynamic Connectivity (combined)
#########################################
DFC_T1=~ Thal_DFC_v5_t1 + Thal_DFC_v6_t1 + Thal_DFC_v7_t1 + Thal_DFC_v8_t1 + Thal_DFC_v9_t1 +
Stra_DFC_v1_t1 + Stra_DFC_v2_t1 + Stra_DFC_v3_t1 + Stra_DFC_v4_t1  
DFC_T2=~ equal("DFC_T1=~Thal_DFC_v5_t1")*Thal_DFC_v5_t2+
equal("DFC_T1=~Thal_DFC_v6_t1")*Thal_DFC_v6_t2+
equal("DFC_T1=~Thal_DFC_v7_t1")*Thal_DFC_v7_t2+
equal("DFC_T1=~Thal_DFC_v8_t1")*Thal_DFC_v8_t2+
equal("DFC_T1=~Thal_DFC_v9_t1")*Thal_DFC_v9_t2+
equal("DFC_T1=~Stra_DFC_v1_t1")*Stra_DFC_v1_t2+
equal("DFC_T1=~Stra_DFC_v2_t1")*Stra_DFC_v2_t2+
equal("DFC_T1=~Stra_DFC_v3_t1")*Stra_DFC_v3_t2+
equal("DFC_T1=~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

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

#########################################
# Dynamic Connectivity
#########################################

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

dEL ~ cEL*medication_binary +bdEL*dDFC     # regression
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
totalIA:=cIA + abIA2
permedabIA2:=abIA2/totalIA

abHA2:=adfc*bdHA
totalHA:=cHA + abHA2
permedabHA2:=abHA2/totalHA
'

# 3. SFC only (thalamus, striatum separately)
model.st.separatesfc='
## Resting state static/dynamic functional connectivity measures

#########################################
# Static Connectivity - THalamus
#########################################
Tha_SFC_T1=~Thal_SFC_v1_t1 + Thal_SFC_v2_t1 + Thal_SFC_v3_t1 + Thal_SFC_v4_t1 + Thal_SFC_v5_t1 + Thal_SFC_v6_t1 
# This specifies the measurement model for Attention at baseline
Tha_SFC_T2=~equal("SFC_T1=~Thal_SFC_v1_t1")*Thal_SFC_v1_t2+
equal("SFC_T1=~Thal_SFC_v2_t1")*Thal_SFC_v2_t2+
equal("SFC_T1=~Thal_SFC_v3_t1")*Thal_SFC_v3_t2+
equal("SFC_T1=~Thal_SFC_v4_t1")*Thal_SFC_v4_t2+
equal("SFC_T1=~Thal_SFC_v5_t1")*Thal_SFC_v5_t2+
equal("SFC_T1=~Thal_SFC_v6_t1")*Thal_SFC_v6_t2

Tha_SFC_T2 ~ 1*Tha_SFC_T1     
Tha_dSFC =~ 1*Tha_SFC_T2     
Tha_SFC_T2 ~ 0*1          
Tha_SFC_T2 ~~ 0*Tha_SFC_T2    # This fixes the variance of the COG_T2 to 0 

Tha_dSFC ~ t_asfc*medication_binary     # regression
Tha_SFC_T1 ~  1            
Tha_dSFC ~~  Tha_dSFC       # This estimates the variance of the change scores 
Tha_SFC_T1 ~~   Tha_SFC_T1     
Tha_dSFC~Tha_SFC_T1          # This estimates the self-feedback parameter

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
# Static Connectivity - Striatum
#########################################
Str_SFC_T1=~Stra_SFC_v1_t1 + Stra_SFC_v2_t1 + Stra_SFC_v3_t1 + Stra_SFC_v4_t1 + Stra_SFC_v5_t1 + Stra_SFC_v6_t1 + Stra_SFC_v7_t1 + Stra_SFC_v8_t1 + Stra_SFC_v9_t1 + Stra_SFC_v10_t1 + Stra_SFC_v11_t1+ Stra_SFC_v12_t1+ Stra_SFC_v13_t1+ Stra_SFC_v14_t1
# This specifies the measurement model for Attention at baseline
Str_SFC_T2=~equal("SFC_T1=~Stra_SFC_v1_t1")*Stra_SFC_v1_t2+
equal("SFC_T1=~Stra_SFC_v2_t1")*Stra_SFC_v2_t2+
equal("SFC_T1=~Stra_SFC_v3_t1")*Stra_SFC_v3_t2+
equal("SFC_T1=~Stra_SFC_v4_t1")*Stra_SFC_v4_t2+
equal("SFC_T1=~Stra_SFC_v5_t1")*Stra_SFC_v5_t2+
equal("SFC_T1=~Stra_SFC_v6_t1")*Stra_SFC_v6_t2+
equal("SFC_T1=~Stra_SFC_v7_t1")*Stra_SFC_v7_t2+
equal("SFC_T1=~Stra_SFC_v8_t1")*Stra_SFC_v8_t2+
equal("SFC_T1=~Stra_SFC_v9_t1")*Stra_SFC_v9_t2+
equal("SFC_T1=~Stra_SFC_v10_t1")*Stra_SFC_v10_t2+
equal("SFC_T1=~Stra_SFC_v11_t1")*Stra_SFC_v11_t2+
equal("SFC_T1=~Stra_SFC_v12_t1")*Stra_SFC_v12_t2+
equal("SFC_T1=~Stra_SFC_v13_t1")*Stra_SFC_v13_t2+
equal("SFC_T1=~Stra_SFC_v14_t1")*Stra_SFC_v14_t2


Str_SFC_T2 ~ 1*Str_SFC_T1     
Str_dSFC =~ 1*Str_SFC_T2     
Str_SFC_T2 ~ 0*1          
Str_SFC_T2 ~~ 0*Str_SFC_T2    # This fixes the variance of the COG_T2 to 0 

Str_dSFC ~ s_asfc*medication_binary     # regression
Str_SFC_T1 ~  1            
Str_dSFC ~~  Str_dSFC       # This estimates the variance of the change scores 
Str_SFC_T1 ~~   Str_SFC_T1     
Str_dSFC~Str_SFC_T1          # This estimates the self-feedback parameter

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

dEL ~ cEL*medication_binary +t_bsEL*Tha_dSFC+ s_bsEL*Str_dSFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +t_bsIA*Tha_dSFC + s_bsIA*Str_dSFC    # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary +t_bsHA*Tha_dSFC +s_bsHA*Str_dSFC  # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
t_abEL1:=t_asfc*t_bsEL
s_abEL1:=s_asfc*s_bsEL

totalEL:=cEL + t_abEL1 + s_abEL1 
t_permedabEL1:=t_abEL1/totalEL
s_permedabEL1:=s_abEL1/totalEL

t_abIA1:=t_asfc*t_bsIA
s_abIA1:=s_asfc*s_bsIA
totalIA:=cIA + t_abIA1 + s_abIA1
t_permedabIA1:=t_abIA1/totalIA
s_permedabIA1:=s_abIA1/totalIA

t_abHA1:=t_asfc*t_bsHA
s_abHA1:=s_asfc*s_bsHA
totalHA:=cHA + t_abHA1 + s_abHA1 
t_permedabHA1:=t_abHA1/totalHA
s_permedabHA1:=s_abHA1/totalHA
'

# 4. DFC separately by thalamus and striatum

model.st.separatedfc='
## Resting state static/dynamic functional connectivity measures

#########################################
# Dynamic Connectivity - Thalamus
#########################################

Tha_DFC_T1=~ Thal_DFC_v5_t1 + Thal_DFC_v6_t1 + Thal_DFC_v7_t1 + Thal_DFC_v8_t1 + Thal_DFC_v9_t1 
Tha_DFC_T2=~ equal("DFC_T1=~Thal_DFC_v5_t1")*Thal_DFC_v5_t2+
equal("DFC_T1=~Thal_DFC_v6_t1")*Thal_DFC_v6_t2+
equal("DFC_T1=~Thal_DFC_v7_t1")*Thal_DFC_v7_t2+
equal("DFC_T1=~Thal_DFC_v8_t1")*Thal_DFC_v8_t2+
equal("DFC_T1=~Thal_DFC_v9_t1")*Thal_DFC_v9_t2

Tha_DFC_T2 ~ 1*Tha_DFC_T1     
Tha_dDFC =~ 1*Tha_DFC_T2     
Tha_DFC_T2 ~ 0*1          
Tha_DFC_T2 ~~ 0*Tha_DFC_T2    # This fixes the variance of the COG_T2 to 0 

Tha_dDFC ~ t_adfc*medication_binary     # regression
Tha_DFC_T1 ~  1            
Tha_dDFC ~~  Tha_dDFC       # This estimates the variance of the change scores 
Tha_DFC_T1 ~~   Tha_DFC_T1     
Tha_dDFC~Tha_DFC_T1          # This estimates the self-feedback parameter

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

#########################################
# Dynamic Connectivity - striatum
#########################################

Str_DFC_T1=~Stra_DFC_v1_t1 + Stra_DFC_v2_t1 + Stra_DFC_v3_t1 + Stra_DFC_v4_t1  
Str_DFC_T2=~equal("DFC_T1=~Stra_DFC_v1_t1")*Stra_DFC_v1_t2+
equal("DFC_T1=~Stra_DFC_v2_t1")*Stra_DFC_v2_t2+
equal("DFC_T1=~Stra_DFC_v3_t1")*Stra_DFC_v3_t2+
equal("DFC_T1=~Stra_DFC_v4_t1")*Stra_DFC_v4_t2

Str_DFC_T2 ~ 1*Str_DFC_T1     
Str_dDFC =~ 1*Str_DFC_T2     
Str_DFC_T2 ~ 0*1          
Str_DFC_T2 ~~ 0*Str_DFC_T2    # This fixes the variance of the COG_T2 to 0 

Str_dDFC ~ s_adfc*medication_binary  # regression
Str_DFC_T1 ~  1            
Str_dDFC ~~  Str_dDFC       # This estimates the variance of the change scores 
Str_DFC_T1 ~~   Str_DFC_T1     
Str_dDFC~Str_DFC_T1          # This estimates the self-feedback parameter

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

dEL ~ cEL*medication_binary  +t_bdEL*Tha_dDFC +s_bdEL*Str_dDFC     # regression
dEL ~~  dEL       # This estimates the variance of the change scores 
dEL~ EmoLia_t1          # This estimates the self-feedback parameter


INATT_t2 ~ 1*INATT_t1
dIA =~ 1*INATT_t2
INATT_t2 ~ 0*1
INATT_t2 ~~ 0*INATT_t2    # This fixes the variance of the COG_T2 to 0

dIA ~ cIA*medication_binary +t_bdIA*Tha_dDFC +s_bdIA*Str_dDFC     # regression
dIA ~~  dIA       # This estimates the variance of the change scores
dIA~ INATT_t1          # This estimates the self-feedback parameter


HYPER_t2 ~ 1*HYPER_t1
dHypA =~ 1*HYPER_t2
HYPER_t2 ~ 0*1
HYPER_t2 ~~ 0*HYPER_t2    # This fixes the variance of the COG_T2 to 0

dHypA ~ cHA*medication_binary  +t_bdHA*Tha_dDFC +s_bdHA*Str_dDFC    # regression
dHypA ~~  dHypA       # This estimates the variance of the change scores
dHypA~ HYPER_t1          # This estimates the self-feedback parameter

### Mediation hypothesis
## indirect effect (a*b)
t_abEL2:=t_adfc*t_bdEL
s_abEL2:=s_adfc*s_bdEL
totalEL:=cEL  + t_abEL2 + s_abEL2
t_permedabEL2:=t_abEL2/totalEL
s_permedabEL2:=s_abEL2/totalEL

s_abIA2:=s_adfc*s_bdIA
t_abIA2:=t_adfc*t_bdIA
totalIA:=cIA  + t_abIA2 + s_abIA2
s_permedabIA2:=s_abIA2/totalIA
t_permedabIA2:=t_abIA2/totalIA

s_abHA2:=s_adfc*s_bdHA
t_abHA2:=t_adfc*t_bdHA
totalHA:=cHA +  t_abHA2 + s_abHA2
s_permedabHA2:=s_abHA2/totalHA
t_permedabHA2:=t_abHA2/totalHA
'

