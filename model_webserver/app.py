import numpy as np
from flask import Flask , request , jsonify , render_template
import pickle

#Create flask app
app = Flask(__name__)

#Load the pickle model
model = pickle.load(open("model.pkl","rb"))

@app.route("/")
def Home():
    return render_template("index.html")

@app.route("/predict",methods = ["POST"])
def predict():
    #รับค่า request มาแปลงเป็น float
    float_features = [float(x) for x in request.form.values()]

    #นำค่าที่เป็น float มาเก็บในรูป array 2d
    features=[np.array(float_features)]

    #ทำนายความน่าจะเป็นจากข้อมูลทีรับมา
    probabilities  = model.predict_proba(features)
    probabilities_percent = probabilities* 100


    result = {
        "prediction_text": "ความเสี่ยงที่คุณจะเป็นโรคหลอดเลือดหัวใจใน 10 ปีข้างหน้า : {:.2f}%".format(probabilities_percent[0][1])
    }

    return jsonify(result)

if __name__ == "__main__":
    app.run(debug=True)
