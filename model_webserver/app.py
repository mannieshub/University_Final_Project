import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

# โหลดข้อมูลเทรนและทดสอบโมเดล Logistic Regression จากไฟล์ CSV ที่มีอยู่
df = pd.read_csv("new_data.csv")
X = df.drop("TenYearCHD", axis=1).values
y = df["TenYearCHD"].values

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# โหลดข้อมูลที่ต้องการทำนาย
new_data_df = pd.read_csv("selected_copy.csv")
# ตรวจสอบคอลัมน์ target ในข้อมูลทดสอบ
target_column = "TenYearCHD"
if target_column not in new_data_df.columns:
    raise ValueError(f"The target column '{target_column}' is missing in the new data.")

# โปรตรวจสอบที่จำเป็น, ด้วยข้อมูลที่มีคุณลักษณะที่ถูกต้อง
model = LogisticRegression()
model.fit(X_train, y_train)



# ตรวจสอบคอลัมน์ target ในข้อมูลทดสอบ
if target_column not in new_data_df.columns:
    raise ValueError(f"The target column '{target_column}' is missing in the new data.")

# ทำนายและสร้าง column "percent"
new_data_df["percent"] = model.predict_proba(new_data_df.drop(target_column, axis=1).values)[:, 1] * 100

# บันทึกผลลัพธ์ลงในไฟล์ใหม่
new_data_df.to_csv("new_predicted_data.csv", index=False)
