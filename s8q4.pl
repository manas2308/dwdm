% Facts about symptoms
symptom(amit, fever).
symptom(amit, rash).

% Hypotheses about diseases based on symptoms
% Assuming we have a predefined list of diseases and symptoms for simplicity
% Add more facts as needed
hypothesis(disease1, fever).
hypothesis(disease2, rash).
hypothesis(disease3, fever).
hypothesis(disease4, rash).
hypothesis(disease5, fever).
hypothesis(disease6, rash).

% Rule: Predict the disease based on the symptoms of a person
predict_disease(Person, Disease) :-
    findall(Symptom, symptom(Person, Symptom), Symptoms),
    hypothesis(Disease, Symptom),
    member(Symptom, Symptoms).
