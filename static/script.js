document.addEventListener('DOMContentLoaded', function() {
    var video = document.getElementById('video');
    var canvas = document.getElementById('canvas');
    var startButton = document.getElementById('start');
    var imageNameInput = document.getElementById('imageName');
    var register = document.getElementById('reg');
    var attendance = document.getElementById('attendance');
    var instructionsDiv = document.getElementById('instructions');


    var actions = [
        {instruction: "Capture Image", filenameSuffix: "face"},
        {instruction: "Lift up your head", filenameSuffix: "up"},
        {instruction: "Look down", filenameSuffix: "down"},
        {instruction: "Look slightly to the right", filenameSuffix: "right"},
        {instruction: "Look slightly to the left", filenameSuffix: "left"},
        {instruction: "Smile", filenameSuffix: "smile"},
    ];

    var imageName = ""; // Initialize the imageName variable

    // Access the camera
    navigator.mediaDevices.getUserMedia({ video: true })
        .then(function(stream) {
            video.srcObject = stream;
        })
        .catch(function(err) {
            console.error("Error accessing the camera: " + err);
        });

    // Function to capture the image
    function captureImage(filenameSuffix, index) {
        var context = canvas.getContext('2d');
        context.drawImage(video, 0, 0, canvas.width, canvas.height);
        var dataURL = canvas.toDataURL('image/jpeg');

        // Send the image data and imageName to the server
        fetch('/capture', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'image=' + encodeURIComponent(dataURL) + '&name=' + encodeURIComponent(filenameSuffix + "_" + index) + '&imageName=' + encodeURIComponent(imageName)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
        })
        .catch((error) => {
            console.error('Error:', error);
        });
    }

    // Function to execute the sequence of actions
    function executeActions(actions, actionIndex) {
        if (actionIndex < actions.length) {
            instructionsDiv.innerText = actions[actionIndex].instruction;
            for (let i = 0; i < 8; i++) {
                setTimeout(function() {
                    captureImage(actions[actionIndex].filenameSuffix, i);
                }, i * 125);
            }
            setTimeout(function() {
                executeActions(actions, actionIndex + 1);
            }, 5000);
        } else {
            instructionsDiv.innerText = "Capture sequence completed.";
        }
    }


    function saveActions() {
        fetch('/saveDetails', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            // body: 'image=' + encodeURIComponent(dataURL) + '&name=' + encodeURIComponent(filenameSuffix + "_" + index) + '&imageName=' + encodeURIComponent(imageName)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            window.location.href = '/recognize'; 

           
        })
        .catch((error) => {
            console.error('Error:', error);
        });
    }



    function attendanceFunctionAction() {
        console.log("HELOOO SHOITTTT")
        fetch('/attendanceAction', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            // body: 'image=' + encodeURIComponent(dataURL) + '&name=' + encodeURIComponent(filenameSuffix + "_" + index) + '&imageName=' + encodeURIComponent(imageName)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            // window.location.href = '/recognize'; 

           
        })
        .catch((error) => {
            console.error('Error:', error);
        });
    }


    // Start the sequence of actions
    startButton.addEventListener('click', function() {
        // Get the text inputted by the user
        imageName = imageNameInput.value;
        executeActions(actions, 0);
    });
    

    reg.addEventListener('click', function() {
        // window.location.href = '/recognize?imageName=' + encodeURIComponent(imageNameInput.value);

        saveActions();
    });

    attendance.addEventListener('click', function() {
        // window.location.href = '/recognize?imageName=' + encodeURIComponent(imageNameInput.value);

        attendanceFunctionAction();
    });
});
