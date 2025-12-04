<?php

session_start();
include('../config/db-config.php');
include('../functions/reuseableFunction.php');

if (isset($_POST['add_category_btn'])) {

    $name = $_POST['nama_kategori'];
    $slug = $_POST['slug'];
    $description = $_POST['deskripsi'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keywords = $_POST['meta_keywords'];
    $status = isset($_POST['status']) ? '1':'0';
    $popular = isset($_POST['popularitas']) ? '1':'0';

    $image = $_FILES['gambar']['name'];

    $path = "../uploads/";

    $image_ext = pathinfo($image, PATHINFO_EXTENSION);
    $filename = time().'.'.$image_ext;

    $category_query = "INSERT INTO tb_kategori
    (nama_kategori,slug,deskripsi,meta_title,meta_description,meta_keywords,status,popularitas,gambar)
    VALUES ('$name','$slug','$description','$meta_title','$meta_description','$meta_keywords','$status','$popular','$filename')
    ";

    $category_query_run = mysqli_query($con, $category_query);

    if ($category_query_run) {

        move_uploaded_file($_FILES['gambar']['tmp_name'], $path.$filename);

        redirect("category.php", "Category Added Successfully");

    } else {
        redirect("add-category.php", "Something went wrong");

    }

}

else if (isset($_POST['update_category_btn'])) {

    $category_id = $_POST['category_id'];
    $name = $_POST['nama_kategori'];
    $slug = $_POST['slug'];
    $description = $_POST['deskripsi'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keywords = $_POST['meta_keywords'];
    $status = isset($_POST['status']) ? '1':'0';
    $popular = isset($_POST['popularitas']) ? '1':'0';


    $new_image = $_FILES['gambar']['name'];
    $old_image = $_POST['old_image'];

    $path = "../uploads/";


    if ($new_image != "") {
        // $update_filename = $new_image;
        $image_ext = pathinfo($new_image, PATHINFO_EXTENSION);
        $update_filename = time().'.'.$image_ext;
    } else {
        $update_filename = $old_image;
    }

    $update_query = "UPDATE tb_kategori SET nama_kategori='$name', slug='$slug', deskripsi='$description', meta_title='$meta_title', meta_description='$meta_description', meta_keywords='$meta_keywords', status='$status', popularitas='$popular', gambar='$update_filename' WHERE id_kategori='$category_id'";

    $update_query_run = mysqli_query($con, $update_query);

    if ($update_query_run) {
        if ($_FILES['gambar']['name'] != "") {
            move_uploaded_file($_FILES['gambar']['tmp_name'], $path.$update_filename);
            if (file_exists("../uploads/".$old_image)) {
                unlink("../uploads/".$old_image);
            }
        }
        // redirect("edit-category.php?id=$category_id", "Category Updated Successfully");
        redirect("category.php", "Category Updated Successfully");
    } else {
        redirect("edit-category.php?id=$category_id", "Something went wrong, try again");
    }

} 

else if (isset($_POST['delete_category_btn'])) {

    $category_id = mysqli_real_escape_string($con, $_POST['category_id']);

    $category_query = "SELECT * FROM tb_kategori WHERE id_kategori='$category_id'";
    $category_query_run = mysqli_query($con, $category_query);
    $category_data = mysqli_fetch_array($category_query_run);
    $image = $category_data['gambar'];

    $delete_query = "DELETE FROM tb_kategori WHERE id_kategori='$category_id'";
    $delete_query_run = mysqli_query($con, $delete_query);

    if ($delete_query_run) {

        if (file_exists("../uploads/".$image)) {
            unlink("../uploads/".$image);
        }

        redirect("category.php", "Category deleted successfully");
    } else {
        redirect("category.php", "Something went wrong");

    }
}
?>