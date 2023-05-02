# FYP-Biomass-Estimation

Dataset link - https://drive.google.com/drive/folders/1lwilyc7gEdMOwP_qybrQhb8uYDG5hgJO?usp=share_link

Step 1: Preprocessing. Use image enhancement techniques to find the best one by running results of the same on YOLOv8.
The .m files contain code for image enhancement. The ipynb files containYOLOv8 without and with 4 preprocessing techniques.
After enhancing images, annotate using CVAT.ai (https://www.cvat.ai/) and upload to Roboflow (https://app.roboflow.com/).



Step 2: Object detction- YOLOv8
Object Detection using YOLOv8 
Four different architectures using different detection heads
P3 to P5 - original with 3 detection heads
P3 to P6 - original with 4 detection heads
P2 to P6 - modified YOLOv8 with 5 detection heads
P4 to P6 - modified YOLOv8 with 3 detection heads
Run the corresponding ipynb files. Results will be saved in ultralytics/runs.

Dataset link - https://drive.google.com/file/d/1ELYq5ZK5aPMdn1n_CAzkSeV4HdRor0fz/view?usp=share_link
Step 3: Regression models
(i) Depth Estimator- To estimate depth given bounding box dimensions
(ii) Pixel to cm Convertor- To convert length and width from pixels to cm using depth.
(iii) Biomass Estimator- To estimate biomass given length and width in cm along with turbidity.

UI- complete working
Create an account with Flask Ngrok, acquire the auth token.
Use the auth token while setting up the flask connection.
Run the notebook named UI in UI folder.
When the flask app runs-a link to the deployed app will be generated clicking which will take you to the index page of the app.
