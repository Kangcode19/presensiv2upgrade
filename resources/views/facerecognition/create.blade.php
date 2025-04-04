<div class="row">
    <div class="col">
        <div class="webcam-capture m-auto"></div>
    </div>
</div>
<div class="row mt-2">
    <div class="col">
        <button id="btnAmbilfoto" class="btn btn-primary w-100"><i class="ti ti-camera me-1"></i>Ambil Foto</button>
    </div>
</div>
<script>
    $(function() {
        Webcam.set({
            height: 480,
            width: 640,
            image_format: 'jpeg',
            jpeg_quality: 80
        });

        Webcam.attach('.webcam-capture');

        $("#btnAmbilfoto").click(function() {
            Webcam.snap(function(uri) {
                image = uri;
            });
            $.ajax({
                type: 'POST',
                url: "{{ route('facerecognition.store') }}",
                data: {
                    _token: "{{ csrf_token() }}",
                    nik: "{{ $nik }}",
                    image: image,
                },
                success: function(data) {
                    swal.fire({
                        icon: 'success',
                        title: 'Berhasil',
                        text: 'Wajah Berhasil Di Daftarkan',
                        showConfirmButton: false,
                        timer: 1500,
                    }).then(function() {
                        location.reload();
                    });
                },
                error: function(xhr) {
                    swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: xhr.responseJSON.message,
                        showConfirmButton: false,
                        timer: 1500,
                    });
                }
            });
        });
    });
</script>
