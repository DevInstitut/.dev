const fs = require('fs');
const lg = console.log;

const WORK_DIR = process.argv.length > 2 ? process.argv[2] : 'photos';
const PREFIX = process.argv.length > 3 ? process.argv[3] : 'nantes';


fs.readdir(WORK_DIR,
    (err, files) => files.forEach((file, i) => {
        const tab = file.split("."),
            ext = '.' + tab.pop();
        fs.rename(`${WORK_DIR}/${file}`, `${WORK_DIR}/${PREFIX}-${i+1}${ext}`,
            (err) => {
                if (err) console.log('ERROR: ', err);
            })
    }));