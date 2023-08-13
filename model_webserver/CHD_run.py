import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

# อ่านข้อมูลจากไฟล์ csv
df = pd.read_csv("cleaned_CHD.csv")
X = df.drop("TenYearCHD",axis=1).values
y = df["TenYearCHD"].values

# แบ่งข้อมูลเป็น train set และ test set
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2, random_state=0)

# สร้างโมเดล logistic regression
model = LogisticRegression()

# ฝึกโมเดล
model.fit(X_train, y_train)

# ทำนายผลสำหรับ test set
y_pred = model.predict(X_test)

# Predict probabilities for the test set
p_data=[[0,46,2,0,0,0.0,0,0,0,250.0,121.0,81.0,28.73,95.0,76.0]]
probabilities = model.predict_proba(p_data)

# Convert the predicted probabilities to percent
probabilities_percent = probabilities * 100

# คำนวณค่า accuracy
accuracy = model.score(X_test, y_test)
print("Predicted probabilities (in percent):", probabilities_percent[0]) #class 0 1
print("You are more likely to have coronary heart disease(CHD) in tenyears with : ",probabilities_percent[0][1]," %")
print("Accuracy:", accuracy*100)
