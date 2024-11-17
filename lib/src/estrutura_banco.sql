CREATE TABLE vacina (
    id_vacina SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE animal (
    id_animal SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    link_foto VARCHAR(255),
    observacao TEXT
);

CREATE TABLE animal_vacina (
    id_animal INTEGER REFERENCES animal(id_animal),
    id_vacina INTEGER REFERENCES vacina(id_vacina),
    data_aplicacao DATE,
    data_agendada DATE,
    vacinado BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_animal, id_vacina)
);

-- Inserindo as vacinas possíveis
INSERT INTO vacina (nome) VALUES
('Vacinacao Antirrábica'),
('Vacinacao Polivalente'),
('Vacinacao Contra Leptospirose'),
('Vacinacao Contra Parvovirose'),
('Vacinacao Contra Cinomose');

-- Inserindo os animais
INSERT INTO animal (nome, link_foto, observacao) VALUES
('Rex', '00000-266704894.png', 'Cachorro da raça Pastor Alemão, muito ativo e brincalhão.'),
('Bella', '00007-1482622357.png', 'Cachorra vira-lata muito carinhosa.'),
('Max', '00027-253385948.png', 'Cachorro da raça Golden Retriever, adora água.'),
('Luna', '00031-253385952.png', 'Gata siamesa, tranquila e adoradora de carinho.'),
('Thor', '00063-1066880983.png', 'Cachorro da raça Bull Terrier, energético e curioso.'),
('Mia', '00083-3740635177.png', 'Gata persa, gosta de dormir o dia todo.'),
('Bob', '00088-3740635182.png', 'Cachorro da raça Beagle, gosta de farejar tudo.'),
('Lily', '00085-3740635179.png', 'Cachorra da raça Poodle, pequena e muito dócil.'),
('Simba', '00082-3740635176.png', 'Gato siamês, independente e aventureiro.'),
('Charlie', '00077-1375940617.png', 'Cachorro da raça Cocker Spaniel, amigável e leal.'),
('Duda', '00078-1375940618.png', 'Gata preta, muito reservada e silenciosa.'),
('Lucky', '00061-1066880981.png', 'Cachorro vira-lata, muito brincalhão e alegre.'),
('Mickey', '00059-1066880979.png', 'Cachorro da raça Dachshund, pequeno e curioso.'),
('Nina', '00045-1249843569.png', 'Cachorra da raça Boxer, adora correr e brincar.'),
('Zeca', '00018-1766549437.png', 'Gato mestiço, calmo e carinhoso.');

-- Inserindo os registros na tabela animal_vacina
INSERT INTO animal_vacina (id_animal, id_vacina, data_aplicacao, data_agendada, vacinado) VALUES
(1, 1, '2024-01-15', '2024-12-15', TRUE),
(1, 2, '2024-01-15', '2024-12-15', TRUE),
(1, 3, null, '2024-12-20', FALSE),
(1, 4, null, '2024-12-20', FALSE),
(1, 5, null, '2024-12-25', FALSE),
(2, 1, '2024-01-10', '2024-12-10', TRUE),
(2, 2, '2024-01-10', '2024-12-10', TRUE),
(2, 3, null, '2024-12-15', FALSE),
(2, 4, '2024-02-05', '2024-12-15', TRUE),
(2, 5, '2024-03-01', '2024-12-20', TRUE),
(3, 1, '2024-01-20', '2024-12-20', TRUE),
(3, 2, '2024-01-20', '2024-12-20', TRUE),
(3, 3, '2024-02-15', '2024-12-25', TRUE),
(3, 4, '2024-02-15', '2024-12-25', TRUE),
(3, 5, null, '2024-12-30', FALSE),
(4, 1, '2024-01-25', '2024-12-25', TRUE),
(4, 2, '2024-01-25', '2024-12-25', TRUE),
(4, 3, null, '2024-12-30', FALSE),
(4, 4, null, '2024-12-30', FALSE),
(4, 5, '2024-03-15', '2024-12-31', TRUE);
