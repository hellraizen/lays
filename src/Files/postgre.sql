create table cliente(
codigo serial,
nome varchar(80) not null,
cpf varchar(11),
dataNascimento varchar(14), 
sexo varchar(20),
email varchar(60),
telefone varchar(15),
peso numeric(8,2),
altura numeric(8,2),
status varchar(20),
rua varchar(80),
bairro varchar(40),
numero varchar(10),
cidade varchar(30),
cep varchar(20),
complemento varchar(80),
primary key (cpf)
);

create table atendimento(
codigo serial,
tipo varchar(20),
valor numeric(8,2),
primary key (codigo)
);

create table caixateste(
cod serial,
entrada numeric(8,2),
saida   numeric(8,2),
Idcomanda int,
idfuncionario int,

primary key (cod)
);

create table funcionariotest(
idFuncionario serial,
nomeFuncionario varchar(50),
cpfFuncionario varchar(14),
enderecoFuncionario varchar(50),
dataNascimentoFuncionario varchar(11),
sexoFuncionario varchar(10),
telefoneFuncionario varchar(15),
emailFuncionario varchar(50),
tipoFuncionario varchar(20),
login varchar(10),
senha varchar(10),
primary key(idFuncionario)
);

create table log(
cod serial,
data date,
autor varchar(20),
alteracao varchar(30),

primary key (cod)
);     

create function gera_log() returns trigger as

$$

Begin

         insert into log (data, autor, alteracao) values (now(), user, TG_OP);

         return new;

end;

$$
language 'plpgsql';

Create trigger gerarLog
AFTER insert
ON clientetest
FOR EACH ROW
execute PROCEDURE gera_log();


