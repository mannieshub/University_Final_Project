import pandas as pd

# โหลดข้อมูลจากไฟล์ CSV
file1_path = 'selected_copy.csv'
file2_path = 'cleaned_CHD.csv'

df1 = pd.read_csv(file1_path)
df2 = pd.read_csv(file2_path)

# เปรียบเทียบแถวและลบแถวที่ซ้ำกันจากไฟล์ที่ 2
df2 = df2.merge(df1, how='left', indicator=True).loc[lambda x: x['_merge'] == 'left_only'].drop(columns=['_merge'])

# บันทึกข้อมูลลงในไฟล์ CSV ใหม่
df2.to_csv('new_data.csv', index=False)
