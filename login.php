<?php 

session_start();

if (isset($_SESSION['auth'])) {
    $_SESSION['message'] = "Anda sudah masuk ke akun Anda.";
    header('Location: index.php');
    exit();
}

include("includes/header.php") 
?>

<div class="h-screen flex items-center justify-center px-4">

  <div class="w-full max-w-md bg-white rounded-2xl shadow-sm border border-gray-200 p-8 space-y-10">

  <div>
    <h2 class="text-center text-3xl font-semibold text-gray-900 mb-5">
      Login
    </h2>

    <p class="text-center text-gray-500 text-sm">
      Masuk ke Akun Anda
    </p>

  </div>

    <form 
      method="POST" 
      action="proses/proses-auth-login.php" 
      class="space-y-6"
    >

      <!-- Email -->
      <div class="relative">
        <input
          type="email"
          name="email"
          required
          placeholder="Email"
          class="peer w-full h-11 border-b border-gray-300 bg-transparent text-gray-900 placeholder-transparent focus:outline-none focus:border-gray-900"
        />
      <label class="absolute left-0 -top-4 text-xs text-gray-500">
        Email
      </label>

      </div>

      <!-- Password -->
      <div class="relative">
        <input
          type="password"
          name="password"
          required
          placeholder="Password"
          class="peer w-full h-11 border-b border-gray-300 bg-transparent text-gray-900 placeholder-transparent focus:outline-none focus:border-gray-900"
        />
      <label class="absolute left-0 -top-4 text-xs text-gray-500">
        Password
      </label>
      </div>

      <!-- Submit -->
      <button
        type="submit"
        name="login_btn"
        class="w-full h-11 rounded-lg bg-gray-900 text-white font-medium hover:bg-black transition"
      >
        Masuk
      </button>

    </form>

    <div class="text-center text-sm text-gray-500">
      Belum memiliki akun?
      <a href="register.php" class="text-gray-900 hover:underline font-medium">
        Buat akun
      </a>
    </div>

  </div>
</div>

<?php include("includes/footer.php") ?>
