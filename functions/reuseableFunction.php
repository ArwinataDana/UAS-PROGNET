<?php

    include('../config/db-config.php');

    // Function fetch all category
    function getAll($table){
        global $con;
        $query = "SELECT * FROM $table";
        return $query_run = mysqli_query($con, $query);
    }

    // Function fetch category by id
    function getCatById($table, $id){
        global $con;
        $query = "SELECT * FROM $table WHERE id_kategori = '$id'";
        return $query_run = mysqli_query($con, $query);
    }

    // Message Return Function
    function redirect($path, $message){

        $_SESSION['message'] = $message;
        header('Location: '.$path);
        exit();
    }

?>