import cv2
import numpy as np
import tensorflow as tf
import json
import os
import pathlib


def load_class_names(json_path):
    with open(json_path, 'r') as f:
        class_names = json.load(f)
    return class_names


def detect_faces(image, face_cascade):
    face_cascade = cv2.CascadeClassifier(face_cascade)
    
    if face_cascade.empty():
        raise IOError(f"Could not load Haar cascade file from {face_cascade}")
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
    return faces

def preprocess_image(image, target_size):
    target_size = (180, 180)  # or any other desired dimensions
    image_resized = cv2.resize(image, target_size)
    # cv2.imwrite("test.jpg", image_resized)
    image_normalized = image_resized / 255.0
    image_expanded = np.expand_dims(image_resized, axis=0)
    return image_expanded

def recognize_faces(image, model, target_size, face_cascade, class_names):
    faces = detect_faces(image, face_cascade)
    results = []
    for (x, y, w, h) in faces:
        face_roi = image[y:y+h, x:x+w]

        # cv2.imwrite("test1.jpg", face_roi)
        face_preprocessed = preprocess_image(face_roi, target_size)
        prediction = model.predict(face_preprocessed)
        predicted_class_index = np.argmax(prediction)
        predicted_class_name = class_names[predicted_class_index]
        results.append((x, y, w, h, predicted_class_name))
    return results

def main():
    print("SHIIIIIIIIT")
    
    # Path to the Haar cascade file
    cascade_path = 'haarcascade_frontalface_default.xml'
    
    # Load your image
    image_path = 'test/hahaha.jpg'
    image = cv2.imread(image_path)
    
    # Load the Keras model
    # model = tf.keras.models.load_model('path/to/your/model.keras')
    model = tf.keras.models.load_model('model/face_recog_model.keras')


    class_names_path = 'class_name/class_names.json'
    class_names = load_class_names(class_names_path)
    print("Class names loaded successfully.")

    # data_dir = pathlib.Path("test/hahaha.jpg") 

    # img = tf.keras.utils.load_img(
    #     data_dir, target_size=(180, 180)
    # )
    # img_array = tf.keras.utils.img_to_array(img)
    # img_array = tf.expand_dims(img_array, 0) # Create a batch

    # predictions = model.predict(img_array)
    # score = tf.nn.softmax(predictions[0])

    # print(
    #     "This image most likely belongs to {} with a {:.2f} percent confidence."
    #     .format(class_names[np.argmax(score)], 100 * np.max(score))
    # )
    

    
    video_capture = cv2.VideoCapture(0)  # Use camera 0 (default camera)
    
    while True:
        # Capture frame-by-frame
        ret, frame = video_capture.read()

        # img_array = tf.keras.utils.img_to_array(img)
        img_array = preprocess_image(frame, 180)
        
        # Make prediction
        predictions = model.predict(img_array)
        score = tf.nn.softmax(predictions[0])
        
        print("This image most likely belongs to {} with a {:.2f} percent confidence."
              .format(class_names[np.argmax(score)], 100 * np.max(score)))
        
        # Perform face recognition on the frame
        results = recognize_faces(frame, model, 224, cascade_path, class_names)
        
        # Draw bounding boxes and labels on the frame
        for (x, y, w, h, predicted_class_name) in results:
            cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2)
            label = f"Prediction: {predicted_class_name}"
            cv2.putText(frame, label, (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (255, 0, 0), 2)
        
        # Display the resulting frame
        cv2.imshow('Video', frame)
        
        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    
    # Release the video capture object and close the display window
    video_capture.release()
    cv2.destroyAllWindows()

# if __name__ == "__main__":
#     main()
