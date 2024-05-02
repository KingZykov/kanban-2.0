<?php
    class Database{
        private $hostname = 'localhost';
        private $username = 'root';
        private $password = 'root';
        private $database = 'kanban_board';
        private $connection;

        public function connection(){
            $this->connection = null;
            try
            {
                $this->connection = new PDO('mysql:host=' . $this->hostname . ';dbname=' . $this->database . ';charset=utf8', 
                $this->username, $this->password);
            }
            catch(Exception $e)
            {
                die('Error : '.$e->getMessage());
            }

            return $this->connection;
        }
    }
?>
