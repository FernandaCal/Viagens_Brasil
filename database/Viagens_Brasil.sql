-- Apaga o banco de dados caso exista.
DROP DATABASE IF EXISTS viagens_brasil;

-- Cria o banco de dados
CREATE DATABASE viagens_brasil CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona banco de dados.
USE viagens_brasil; 

-- Cria tabela de usuários/autores.
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255),
    user_email VARCHAR(255),
    user_birth DATE,
    user_photo VARCHAR(255),
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_profile TEXT,
    user_password VARCHAR(255),
    user_type ENUM('user', 'author', 'admin') DEFAULT 'user',
    user_status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Cria tabela de artigos
CREATE TABLE articles (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_title VARCHAR(127),
    art_intro VARCHAR(255),
    art_thumb VARCHAR(255),
    art_content TEXT,
    art_author INT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_views INT DEFAULT '0',
    art_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (art_author) REFERENCES users (user_id)
);

-- Cria tabela de comentários nos artigos
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY AUTO_INCREMENT,
    cmt_article INT,
    cmt_author INT,
    cmt_comment TEXT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id),
    FOREIGN KEY (cmt_author) REFERENCES users (user_id)
);

-- Cria tabela com contatos do site
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(127),
    email VARCHAR(255),
    subject VARCHAR(255),
    message TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Insere dados em 'users'
INSERT INTO users (
    user_name,
    user_email,
    user_birth,
    user_photo,
    user_profile,
    user_password,
    user_type
) VALUES 
(
    'Jucelino Silveira',
    'jucelino@.com',
    '1989-09-11',
    'https://randomuser.me/api/portraits/lego/3.jpg',
    'Programador, agricultor, enrolador, fazedor de nada.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Emegarda Sirineuza',
    'emen@siri.com',
    '2000-01-11',
    'https://randomuser.me/api/portraits/lego/2.jpg',
    'Cantora, compositora, arranjadora, arrumadora e operadora.',
    SHA1('Qw3rtyui0P'),
    'user'
),
(
    'Eletricildo Chocante',
    'eletro@choque.com',
    '1981-05-02',
    'https://randomuser.me/api/portraits/lego/6.jpg',
    'Motorista, eletricista, ortopedista e horista.',
    SHA1('Qw3rtyui0P'),
    'admin'
),
(
    'Juanita Malita',
    'nitamalita@gmail.com',
    '1991-10-12',
    'https://randomuser.me/api/portraits/lego/4.jpg',
    'Motorista, eletricista, ortopedista e horista.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Genesito Malito',
    'genemalito@google.com',
    '2000-11-01',
    'https://randomuser.me/api/portraits/lego/1.jpg',
    'Motorista, eletricista, ortopedista e horista.',
    SHA1('Qw3rtyui0P'),
    'author'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'São Paulo a terra da garoa!!!',
    'Os melhores  pontos turisticos de Sampa.',
    '/img/articles/São Paulo01.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="/img/articles/São Paulo01.jpg" alt="São Paulo"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '1'
),
(
    'Bahia a terra da  diversidade e da alegria!!!',
    'Viage pelas maravilhas de uma Bahia inesquecível!!.',
    '/img/articles/Bahia.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="/img/articles/Bahia.jpg" alt="Elevador Lacerda"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '1'
),
(
    'Rio de Janeiro, terra do sol e das alegrias!!!',
    'Neste artigo aprenderemos sobre as maravilhas de uma das cidades mais facinantes do país!!!',
    '/img/articles/rio de janeiro01.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="/img/articles/rio de janeiro01.jpg" alt="Rio de Janeiro"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '1'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'Gramado e suas belezas naturais!!!',
    'Neste artigo aprenderemso sobre os pontos turísticos de belezas naturais.',
    '/img/articles/Gramado.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="/img/articles/Gramado.jpg" alt="Gramado"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '4'
),
(
    'Campos do Jordão!!!',
    'Um lugar de requinte ao estilo Suíço!!!.',
    '/img/articles/campos do jordão.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="/img/articles/campos do jordão.jpg" alt="Campos do Jordão"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '5'
),
(
    'Minas Gerais!!!',
    'Neste artigo aprenderemos mais sobre a cidade conhecida como  a cidade do estilo colonial.',
    '/img/articles/minasgerais.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="/img/articles/minasgerais.jpg" alt="Minas Gerais"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '4'
);