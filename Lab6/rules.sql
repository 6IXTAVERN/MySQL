# Требуется включить применение ролей после авторизации пользователя
# изначально false, потому что отходит от концепции классич. SQL
# т.е. мб несколько ролей у одного пользователя
SET GLOBAL activate_all_roles_on_login = 1;

########################################################################################################################

# Создание роли руководителя
CREATE ROLE RoleManager;
GRANT SELECT, INSERT, DELETE, UPDATE ON mydb.* TO RoleManager;

# Создание пользователя с ролью руководителя
CREATE USER 'UserManager'@`localhost` IDENTIFIED BY 'pass';
GRANT RoleManager TO 'UserManager'@`localhost`;
# Права на процедуры/функции можно выдать только пользователю напрямую
GRANT EXECUTE ON FUNCTION funcA_GetLongestStayingClient TO 'UserManager'@`localhost`;
GRANT EXECUTE ON PROCEDURE proc_getClientsWhereGreaterAvg TO 'UserManager'@`localhost`;

# Обновление ролей
FLUSH PRIVILEGES;

# Посмотреть разрешения роли и пользователя
SHOW GRANTS FOR RoleManager;
SHOW GRANTS FOR 'UserManager'@'localhost';

########################################################################################################################

# Создание роли сотрудника
CREATE ROLE RoleEmployee;
GRANT SELECT (id_client, full_name, phone) ON mydb.client TO RoleEmployee;
GRANT SELECT (id_client, date_arrival, date_leaving, nutrition, ovr_price) ON mydb.reservation TO RoleEmployee;

# Создание пользователя с ролью сотрудника
CREATE USER 'UserEmployee'@'localhost' IDENTIFIED BY 'pass';
GRANT RoleEmployee TO 'UserEmployee'@'localhost';

# Обновление ролей
FLUSH PRIVILEGES;

# Посмотреть разрешения роли и пользователя
SHOW GRANTS FOR RoleEmployee;
SHOW GRANTS FOR 'UserEmployee'@'localhost';

########################################################################################################################
