from flask import Flask, render_template, request, jsonify
import base64
import os
from PIL import Image
from io import BytesIO
import training_models
import image_recognition
import cv2
import numpy as np

app = Flask(__name__)

# Create a directory to save uploaded images
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

@app.route('/')
def index():
    return render_template('index.html')


def detect_faces(image, face_cascade):
    face_cascade = cv2.CascadeClassifier(face_cascade)
    
    if face_cascade.empty():
        raise IOError(f"Could not load Haar cascade file from {face_cascade}")
    gray = cv2.cvtColor(np.array(image), cv2.COLOR_RGB2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
    return faces

@app.route('/capture', methods=['POST'])
def capture():
    if request.method == 'POST':
        img_data = request.form['image']
        image_name = request.form['name']
        user = request.form['imageName']
        
        img_data = img_data.split(',')[1]  # Remove the "data:image/jpeg;base64," part
        img_data = base64.b64decode(img_data)

        # Open the image using Pillow
        image = Image.open(BytesIO(img_data))

        # Resize the image to 120x120 pixels
        cascade_path = 'haarcascade_frontalface_default.xml'

        faces = detect_faces(image, cascade_path)
        results = []
        for (x, y, w, h) in faces:
            # Crop the face region
            face_roi = image.crop((x, y, x + w, y + h))
            face_roi_array = np.array(face_roi)

# Flip the image horizontally
            flipped_horizontal = cv2.flip(face_roi_array, 1)


            # cv2.imwrite("test1.jpg", face_roi)


            # image = face_roi.resize((180, 180))

        # Save the resized image with the provided name
            if image_name == "":
                image_name = "captured_image"  # Default name if no name is provided
    



            image_dir = os.path.join(UPLOAD_FOLDER, user)
            os.makedirs(image_dir, exist_ok=True)

            # Save the resized image with the provided name inside its directory
            file_path = os.path.join(image_dir, f'{image_name}.jpg')
            file_path_1 = os.path.join(image_dir, f'{image_name}_flipped.jpg')
            face_roi.save(file_path)
            # flipped_horizontal(file_path_1)
            cv2.imwrite(file_path_1, flipped_horizontal)
            # face_preprocessed = preprocess_image(face_roi, target_size)

        
        

        return jsonify({'status': 'success', 'file_path': file_path})

@app.route('/saveDetails', methods=['POST'])
def saveRegistered():
    # image_name = request.args.get('imageName')
    # return render_template('recognize.html', image_name=image_name)

    if request.method == 'POST':
        training_models.training_models()
        return jsonify({'success': True})
    else:
        jsonify({'Error': 'Error'})

@app.route('/recognize')
def recognized():
    # image_recognition.main()
    return render_template('recognize.html')


@app.route('/attendanceAction', methods=['POST'])
def attendanceAction():
    print("FUNCT")
    if request.method == 'POST':
        image_recognition.main()
        return jsonify({'success': True})


if __name__ == '__main__':
    app.run(debug=True)
