import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

# อ่านข้อมูลจากไฟล์ CSV
df = pd.read_csv("selected_copy.csv")
X = df.drop("TenYearCHD", axis=1).values
y = df["TenYearCHD"].values

# แบ่งข้อมูลเป็นชุดฝึกและชุดทดสอบ
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# สร้างและฝึกโมเดล Logistic Regression
model = LogisticRegression()
model.fit(X_train, y_train)

# ทำนายผลลัพธ์สำหรับทุกระเบียนในไฟล์
df["predicted_probabilities"] = model.predict_proba(X)[:, 1] * 100

# เพิ่ม column "level" ตามเงื่อนไขที่ระบุ
df["level"] = pd.cut(df["predicted_probabilities"], bins=[0, 10, 25, 100], labels=["l", "m", "h"])

# เขียนข้อมูลทั้งหมดลงในไฟล์ CSV ใหม่
df.to_csv("PSW_Test.csv", index=False)

# แสดงผลลัพธ์
print("Predictions and levels have been added to ThaiTest_with_predictions.csv")
