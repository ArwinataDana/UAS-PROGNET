<?php
session_start(); 
include("includes/header.php");
include("validator/user-validator.php");        
include("middleware/clientMiddleware.php");

$items = getCart();
$totalPrice = 0;

foreach ($items as $citem) {
    $totalPrice += $citem['harga_jual'] * $citem['prod_qty'];
}
?>

<div class="mx-6 text-slate-800 mt-24">
    <div class="max-w-[1400px] mx-auto lg:px-4">

        <h2 class="text-3xl font-bold mb-8">Keranjangmu</h2>

        <?php if (count($items) > 0): ?>

        <!-- ⬇️ ID PENTING BUAT JQUERY -->
        <div id="mycart" class="flex items-start justify-between gap-5 max-lg:flex-col">

            <!-- CART TABLE -->
            <table class="w-full text-slate-600 table-auto">
                <thead>
                    <tr class="border-b max-sm:text-sm">
                        <th class="text-left py-3">Produk</th>
                        <th class="text-center">Jumlah</th>
                        <th class="text-center max-sm:hidden">Total</th>
                        <th class="text-center max-md:hidden">Hapus</th>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($items as $cart): ?>
                        <tr class="product-data border-b">

                            <input type="hidden" class="cartid" value="<?= $cart['cid'] ?>">
                            <input type="hidden" class="prodid" value="<?= $cart['id_produk'] ?>">

                            <!-- PRODUCT -->
                            <td class="py-4">
                                <div class="flex gap-3 max-sm:gap-2">
                                    <div class="flex items-center justify-center bg-slate-100 w-18 h-18 max-sm:w-14 max-sm:h-14 rounded-md flex-shrink-0">
                                        <img src="uploads/<?= $cart['gambar'] ?>" 
                                            class="h-16 w-auto object-contain"
                                            alt="<?= $cart['nama_produk'] ?>">
                                    </div>
                                    <div class="min-w-0 flex-1">
                                        <p class="font-medium text-sm sm:text-base break-words leading-snug max-sm:mb-1">
                                            <?= $cart['nama_produk'] ?>
                                        </p>

                                        <p class="text-xs sm:text-sm text-slate-500">
                                            Rp <?= number_format($cart['harga_jual'],0,',','.') ?>
                                        </p>
                                        <!-- Remove button for mobile -->
                                        <button class="deleteItem text-red-500 text-xs mt-2 md:hidden hover:underline"
                                                value="<?= $cart['cid'] ?>">
                                            Hapus
                                        </button>
                                    </div>
                                </div>
                            </td>

                            <!-- QUANTITY -->
                            <td class="text-center px-2">
                                <div class="flex items-center justify-center gap-1 sm:gap-2">
                                    <button class="decrement_btn px-2 sm:px-3 py-1 bg-slate-200 rounded updateQty hover:bg-slate-300 transition text-sm sm:text-base">
                                        -
                                    </button>
                                    <input type="text"
                                        class="qty-input w-8 sm:w-10 h-8 text-center border rounded text-sm sm:text-base"
                                        value="<?= $cart['prod_qty'] ?>"
                                        readonly>
                                    <button class="increment_btn px-2 sm:px-3 py-1 bg-slate-200 rounded updateQty hover:bg-slate-300 transition text-sm sm:text-base">
                                        +
                                    </button>
                                </div>
                            </td>

                            <!-- TOTAL PRICE -->
                            <td class="text-center font-medium px-2 text-sm sm:text-base max-sm:hidden">
                                Rp <?= number_format($cart['harga_jual'] * $cart['prod_qty'],0,',','.') ?>
                            </td>

                            <!-- REMOVE (Desktop only) -->
                            <td class="text-center max-md:hidden">
                                <button class="deleteItem text-red-500 hover:bg-red-50 p-2.5 rounded-full transition-all text-sm"
                                        value="<?= $cart['cid'] ?>">
                                    Hapus
                                </button>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <!-- ORDER SUMMARY -->
            <div class="w-full max-w-lg lg:max-w-[340px] bg-slate-50/30 border border-slate-200 text-slate-500 text-sm rounded-xl p-7">

                <h2 class="text-xl font-medium text-slate-600 mb-4">Rincian Pambayaran</h2>

                <div class="pb-4 border-b border-slate-200">
                    <div class="flex justify-between">
                        <div class="flex flex-col gap-1 text-slate-400">
                            <p>Subtotal:</p>
                            <p>Pengiriman:</p>
                        </div>
                        <div class="flex flex-col gap-1 font-medium text-right">
                            <p>Rp <?= number_format($totalPrice,0,',','.') ?></p>
                            <p>Gratis</p>
                        </div>
                    </div>
                </div>

                <div class="flex justify-between py-4">
                    <p>Total:</p>
                    <p class="font-medium text-right">
                        Rp <?= number_format($totalPrice,0,',','.') ?>
                    </p>
                </div>

                <a href="checkout.php"
                   class="block text-center w-full bg-slate-700 text-white py-2.5 rounded hover:bg-slate-900 active:scale-95 transition-all">
                    Pesan Sekarang
                </a>

            </div>

        </div>

        <?php else: ?>

        <div class="mt-10 flex items-center justify-center text-slate-400">
            <h1 class="text-2xl sm:text-4xl font-semibold">Keranjangmu kosong</h1>
        </div>

        <?php endif; ?>

    </div>
</div>

<?php include("includes/footer.php") ?>
