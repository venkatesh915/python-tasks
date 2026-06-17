

db.patients.insertmany([{"patient_name":"eswar","age":25, "city": "hyderabad"},{"patient_name": "priya", "age":21,"city":"chirala"},{"patient_name":"venky","age":21, "city":"chirala"},{"patient_name":"anil","age":28,"city":"hyderabad"},{"patient_name":"ramya","age":35,"city":"vizag"}]);

db.appointments.insertmany([{"patient_id":1, "doctor_name": "dr ramesh","date":"2026-06-01"},{"patient_id":2,"doctor_name":"dr suresh","date":"2026-06-02"},{ "patient_id":3,"doctor_name":"dr ramesh","date":"2026-06-03"},{"patient_id":4,"doctor_name":"dr lakshmi","date":"2026-06-04"},{"patient_id":1,"doctor_name":"dr suresh","date":"2026-06-05"}]);

db.patients.find();
db.patients.find({"city":"chirala"});
db.appointments.find({ "doctor_name": "dr ramesh"});


db.patients.updateone({ "patient_name":"eswar"},{"$set":{"city":"vizag"}});


db.patients.deleteone({"patient_name":"ramya"});

db.patients.aggregate([{ "$group":{"_id":"$city", "total_patients":{"$sum":1}}}]);

db.appointments.aggregate([{ "$group":{"_id": "$doctor_name","total_appointments":{ "$sum":1}}}]);
