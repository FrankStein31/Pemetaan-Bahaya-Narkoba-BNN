const Toast = Swal.mixin({
    iconColor: "white",
    customClass: {
        popup: "colored-toast",
    },
    didOpen: (toast) => {
        toast.addEventListener("mouseenter", Swal.stopTimer);
        toast.addEventListener("mouseleave", Swal.resumeTimer);
    },
});

function setMessage(message, status) {
    Toast.fire({
        icon: status,
        title: message,
        showConfirmButton: false,
        timer: 4000,
        timerProgressBar: true,
        toast: true,
        position: "top-end",
    });
}

// $(".buttonEditSosialisasi").on("click", function () {
//     const code = $(this).data("code");
//     const judul = $(this).data("judul");
//     const deskripsi = $(this).data("deskripsi");
//     $("#codeEditSosialisasi").val(code);
//     $("#judul").val(judul);
//     $("#deskripsi").val(deskripsi);
    
//     $("#formModalAdminEditSosialisasi").modal("show");
// });
// Contoh JavaScript untuk mengisi form edit
function editSosialisasi(code, judul, deskripsi, gambarPath) {
    document.getElementById('codeEditSosialisasi').value = code;
    document.getElementById('judul').value = judul;
    document.getElementById('deskripsi').value = deskripsi;
    
    // Set preview gambar
    if (gambarPath) {
        document.getElementById('preview_gambar').src = '/storage/' + gambarPath;
    } else {
        document.getElementById('preview_gambar').src = ''; // Kosongkan jika tidak ada gambar
    }
}
$(".buttonEditSosialisasi").on("click", function () {
    const code = $(this).data("code");
    const judul = $(this).data("judul");
    const deskripsi = $(this).data("deskripsi");
    const gambar = $(this).data("gambar");

    // Set nilai form
    $("#codeEditSosialisasi").val(code);
    $("#judul").val(judul);
    $("#deskripsi").val(deskripsi);

    $("#preview_gambar").attr("src", gambar);
    
    $("#formModalAdminEditSosialisasi").modal("show");
});

$(".buttonDeleteSosialisasi").on("click", function () {
    const code = $(this).data("code");
    const judul = $(this).data("judul");
    $("#codeDeleteSosialisasi").val(code);
    $(".judulSosialisasiDelete").html(
        "Hapus sosialisasi berjudul <strong>" + judul + "</strong> ?"
    );
    $("#deleteSosialisasi").modal("show");
});

const tambahSosialisasi = $(".flash-message").data(
    "flash-message-sosialisasi"
    );
    if (tambahSosialisasi) {
    setMessage(tambahSosialisasi, "success");
    }
    const deleteSosialisasi = $(".flash-message").data(
    "delete-sosialisasi"
    );
    if (deleteSosialisasi) {
    setMessage(deleteSosialisasi, "success");
    }
    const editSosialisasiSukses = $(".flash-message").data(
        "edit-sosialisasi"
    );
    if (editSosialisasiSukses) {
        setMessage(editSosialisasiSukses, "success");
    }

// $(document).on('click', '.buttonDeleteSosialisasi', function () {
//     let code = $(this).data('code');
//     let judul = $(this).data('judul');

//     $('#codeDeleteSosialisasi').val(code); // Pastikan id sudah terenkripsi sebelum dikirim
//     $('.judulSosialisasiDelete').text(`Apakah Anda yakin ingin menghapus "${judul}"?`);
// });