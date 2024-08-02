import os
import zipfile
import subprocess
from flask import Flask, request, jsonify, render_template

app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
EXTRACT_FOLDER = 'extracted'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['EXTRACT_FOLDER'] = EXTRACT_FOLDER

@app.route('/', methods=['GET', 'POST'])
def upload_and_process():
    if request.method == "POST":
        if 'file' not in request.files:
            return jsonify({'error': 'No file part'}), 400

        file = request.files['file']

        if file.filename == '':
            return jsonify({'error': 'No selected file'}), 400

        if file and file.filename.endswith('.zip'):
            # save the zip file
            zip_path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
            file.save(zip_path)

            # create extraction directory
            extract_path = os.path.join(app.config['EXTRACT_FOLDER'], os.path.splitext(file.filename)[0])
            os.makedirs(extract_path, exist_ok=True)

            # extract the zip file
            with zipfile.ZipFile(zip_path, 'r') as zip_ref:
                zip_ref.extractall(extract_path)

            # perform commands on extracted files
            try:
                result = subprocess.run(['ls', extract_path], capture_output=True, text=True, check=True)
                ls_output = result.stdout
            except subprocess.CalledProcessError as e:
                return jsonify({'error': f'Error executing dir command: {str(e)}'}), 500

            return jsonify({
                'output': ls_output
            })

        return jsonify({'error': 'Invalid file format. Please upload a zip file.'}), 400
    return render_template("ui.html")

if __name__ == '__main__':
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)
    os.makedirs(EXTRACT_FOLDER, exist_ok=True)
    app.run(host='0.0.0.0', port=5000, debug=True)
