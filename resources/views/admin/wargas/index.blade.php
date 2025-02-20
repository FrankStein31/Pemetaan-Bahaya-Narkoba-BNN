@extends('layouts.main.index')
@section('container')
<style>
  ::-webkit-scrollbar {
    display: none;
  }

  @media screen and (min-width: 1320px) {
    #search {
      width: 250px;
    }
  }

  @media screen and (max-width: 575px) {
    .pagination-mobile {
      display: flex;
      justify-content: end;
    }
  }
</style>
<div class="flash-message" data-edit-patient="@if(session()->has('editPatientSuccess')) {{ session('editPatientSuccess') }} @endif" data-delete-patient="@if(session()->has('deletePatientSuccess')) {{ session('deletePatientSuccess') }} @endif"></div>
<div class="edit-error-validate" data-error-name="@error('name') {{ $message }} @enderror" data-error-address="@error('address') {{ $message }} @enderror" data-error-old="@error('old') {{ $message }} @enderror" data-error-gender="@error('gender') {{ $message }} @enderror"></div>
<div class="row">
  <div class="col-md-12 col-lg-12 order-2 mb-4">
    <div class="card h-100">
      <div class="card-header d-flex align-items-center justify-content-between" style="margin-bottom: -0.7rem;">
      <div class="justify-content-start">
          <button type="button" class="btn btn-xs btn-dark fw-bold p-2 buttonAddPatientQueue" data-bs-toggle="modal" data-bs-target="#formModalAdminAddPatientQueue">
            <i class='bx bx-receipt fs-6'></i>&nbsp;TAMBAH DATA
          </button>
        </div>
        <div class="justify-content-end">
          <!-- Search -->
          <form action="/admin/pasien/search">
            <div class="input-group">
              <input type="search" class="form-control" name="q" id="search" style="border: 1px solid #d9dee3;" value="{{ request('q') }}" placeholder="Cari data pasien..." autocomplete="off" />
            </div>
          </form>
          <!-- /Search -->
        </div>
      </div>
      <div class="card-body">
        <ul class="p-0 m-0">
          <div class="table-responsive text-nowrap" style="border-radius: 3px;">
            <table class="table table-striped">
              <thead class="table-dark">
                <tr>
                  <th class="text-white">No</th>
                  <th class="text-white">NIP</th>
                  <th class="text-white">Nama</th>
                  <th class="text-white">Alamat</th>
                  <th class="text-white">Jenis Kelamin</th>
                  <th class="text-white">Dusun</th>
                  <th class="text-white">Desa</th>
                  <th class="text-white">Kecamatan</th>
                  <th class="text-white text-center">Aksi</th>
                </tr>
              </thead>
              <tbody class="table-border-bottom-0">
              @foreach($wargas as $index => $warga)
                <tr>
                  <td>{{ $wargas->firstItem() + $index }}</td>
                  <td>{{ $warga->nik }}</td>
                  <td>{{ $warga->nama }}</td>
                  <td>{{ $warga->alamat }}</td>
                  <td>@if($warga->jk == 'Laki-Laki')<span class="badge bg-label-primary fw-bold">Laki-Laki</span>@else<span class="badge fw-bold" style="color: #ff6384 !important; background-color: #ffe5eb !important;">Perempuan</span>@endif</td>                  
                  <td>{{ $warga->dsn_id }}</td>
                  <td>{{ $warga->ds_id }}</td>
                  <td>{{ $warga->kec_id }}</td>
                  <td class="text-center">
                    <button type="button" class="btn btn-icon btn-primary btn-sm buttonEditWarga" data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="auto" title="Edit Data Warga" data-code="{{ encrypt($warga->id) }}" data-name="{{ $warga->nama }}" data-address="{{ $warga->alamat }}" data-old="{{ $warga->jk }}" data-gender="{{ $warga->dsn_id }}">
                      <span class="tf-icons bx bx-edit" style="font-size: 15px;"></span>
                    </button>
                    <button type="button" class="btn btn-icon btn-danger btn-sm buttonDeleteWargat" data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="auto" title="Delete Warga" data-code="{{ encrypt($warga->id) }}" data-name="{{ $warga->nama }}">
                      <span class="tf-icons bx bx-trash" style="font-size: 14px;"></span>
                    </button>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </ul>

        
      </div>
    </div>
  </div>
</div>

<!-- Modal Delete patient -->
<div class="modal fade" id="deletePatient" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form action="/admin/pasien/delete" method="post" id="formDeleteQueuePatient">
      <input type="hidden" name="codePatient" id="codeDeletePatient">
      @csrf
      <div class="modal-content">
        <div class="modal-header d-flex justify-content-between">
          <h5 class="modal-title text-primary fw-bold">Konfirmasi&nbsp;<i class='bx bx-check-shield fs-5' style="margin-bottom: 3px;"></i></h5>
          <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-dismiss="modal"><i class="bx bx-x-circle text-danger fs-4" data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="auto" title="Tutup"></i></button>
        </div>
        <div class="modal-body" style="margin-top: -10px;">
          <div class="col-sm fs-6 namaPatientDelete"></div>
        </div>
        <div class="modal-footer" style="margin-top: -5px;">
          <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal"><i class='bx bx-share fs-6' style="margin-bottom: 3px;"></i>&nbsp;Tidak</button>
          <button type="submit" class="btn btn-primary"><i class='bx bx-trash fs-6' style="margin-bottom: 3px;"></i>&nbsp;Ya, Hapus!</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- formModalAdminEditPatient -->
<div class="modal fade" id="formModalAdminEditPatient" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form action="/admin/pasien/edit" method="post" class="modalAdminEditPatient">
      @csrf
      <input type="hidden" name='code' value="{{ old('code') }}" id="codeEditPatient">
      <div class="modal-content">
        <div class="modal-header d-flex justify-content-between">
          <h5 class="modal-title text-primary fw-bold">Edit Data Pasien&nbsp;<i class='bx bx-user fs-5' style="margin-bottom: 1px;"></i></h5>
          <button type="button" class="btn p-0 dropdown-toggle hide-arrow cancelModalEditPatient" data-bs-dismiss="modal"><i class="bx bx-x-circle text-danger fs-4" data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="auto" title="Tutup"></i></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col mb-2 mb-lg-3">
              <label for="nama_lengkap_patient" class="form-label required-label">Nama Lengkap</label>
              <input type="text" id="nama_lengkap_patient" name="name" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror" placeholder="Masukkan nama pasien" autocomplete="off" required>
              @error('name')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
          </div>
          <div class="row">
            <div class="col mb-2 mb-lg-3">
              <label for="address" class="form-label required-label">Alamat</label>
              <textarea class="form-control @error('address') is-invalid @enderror" id="address" name="address" autocomplete="off" placeholder="Masukkan alamat pasien. (max 255 karakter)" rows="4" required>{{ old('address') }}</textarea>
              @error('address')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
          </div>
          <div class="row g-2">
            <div class="col">
              <label for="gender_patient" class="form-label required-label">Jenis Kelamin</label>
              <select class="form-select @error('gender') is-invalid @enderror" name="gender" id="gender_patient" style="cursor: pointer;" required>
                <option value="" disabled selected>Pilih Jenis Kelamin</option>
                <option id="laki-laki" @if(old('gender')=='Laki-Laki' ) selected @endif value="Laki-Laki">Laki-Laki</option>
                <option id="perempuan" @if(old('gender')=='Perempuan' ) selected @endif value="Perempuan">Perempuan</option>
              </select>
              @error('gender')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
            <div class="col">
              <label for="old" class="form-label required-label">Umur</label>
              <input type="text" id="old" name="old" value="{{ old('old') }}" class="form-control @error('old') is-invalid @enderror" autocomplete="off" placeholder="Masukkan umur pasien" required>
              @error('old')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-danger cancelModalEditPatient" data-bs-dismiss="modal"><i class='bx bx-share fs-6' style="margin-bottom: 3px;"></i>&nbsp;Batal</button>
          <button type="submit" class="btn btn-primary"><i class='bx bx-save fs-6' style="margin-bottom: 3px;"></i>&nbsp;Save</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- Modal tambah warga-->
<div class="modal fade" id="formModalAdminAddPatientQueue" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form action="" method="post" class="modalAdminAddPatientQueue">
      @csrf
      <div class="modal-content">
        <div class="modal-header d-flex justify-content-between">
          <h5 class="modal-title text-primary fw-bold">Ambil Antrian&nbsp;<i class='bx bx-receipt fs-5' style="margin-bottom: 1px;"></i></h5>
          <button type="button" class="btn p-0 dropdown-toggle hide-arrow cancelModalTakePatientQueue" data-bs-dismiss="modal"><i class="bx bx-x-circle text-danger fs-4" data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="auto" title="Tutup"></i></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col mb-2 mb-lg-3">
                <label for="nik" class="form-label required-label">NIK</label>
                <input type="text" id="nik" name="nik" value="{{ old('nik') }}" class="form-control @error('nik') is-invalid @enderror" placeholder="Masukkan NIK" autocomplete="off" required>
                @error('nik')
                <div class="invalid-feedback" style="margin-bottom: -3px;">
                    {{ $message }}
                </div>
                @enderror
                </div>
            </div>
          <div class="row">
            <div class="col mb-2 mb-lg-3">
              <label for="nama" class="form-label required-label">Nama Lengkap</label>
              <input type="text" id="nama" name="nama" value="{{ old('nama') }}" class="form-control @error('nama') is-invalid @enderror" placeholder="Masukkan nama warga" autocomplete="off" required>
              @error('nama')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
          </div>
          <div class="row">
            <div class="col mb-2 mb-lg-3">
              <label for="alamat" class="form-label required-label">Alamat</label>
              <textarea class="form-control @error('alamat') is-invalid @enderror" id="alamat" name="alamat" autocomplete="off" placeholder="Masukkan alamat warga. (max 255 karakter)" rows="4" required>{{ old('address') }}</textarea>
              @error('address')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
          </div>
          <div class="row g-2">
            <div class="col">
              <label for="kec_id" class="form-label required-label">Kecamatan</label>
              <select class="form-select @error('kec_id') is-invalid @enderror" name="kec_id" id="kec_id" style="cursor: pointer;" required>
                <option value="" disabled selected>Pilih Kecamatan</option>
                <option id="Gurah" @if(old('kec_id')=='Gurah' ) selected @endif value="Gurah">Gurah</option>
                <option id="Ngadiluwih" @if(old('kec_id')=='Ngadiluwih' ) selected @endif value="Ngadiluwih">Ngadiluwih</option>
                <option id="Kandangan" @if(old('kec_id')=='Kandangan' ) selected @endif value="Kandangan">Kandangan</option>
              </select>
              @error('kec_id')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>
            <div class="col">
              <label for="jk" class="form-label required-label">Jenis Kelamin</label>
              <select class="form-select @error('gender') is-invalid @enderror" name="jk" id="jk" style="cursor: pointer;" required>
                <option value="" disabled selected>Pilih Jenis Kelamin</option>
                <option id="laki-laki" @if(old('jk')=='Laki-Laki' ) selected @endif value="Laki-Laki">Laki-Laki</option>
                <option id="perempuan" @if(old('jk')=='Perempuan' ) selected @endif value="Perempuan">Perempuan</option>
              </select>
              @error('gender')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>                     
          </div>
          <div class="row g-4">            
            <div class="col">
              <label for="ds_id" class="form-label required-label">Desa</label>
              <select class="form-select @error('ds_id') is-invalid @enderror" name="ds_id" id="ds_id" style="cursor: pointer;" required>
                <option value="" disabled selected>Pilih Desa</option>
                <option id="Kandangan" @if(old('ds_id')=='Kandangan' ) selected @endif value="Kandangan">Kandangan</option>
                <option id="Ngadiluwih" @if(old('ds_id')=='Ngadiluwih' ) selected @endif value="Ngadiluwih">Ngadiluwih</option>
              </select>
              @error('ds_id')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>  
            <div class="col">
              
            </div>            
          </div>
          <div class="row g-4">            
            <div class="col">
              <label for="dsn_id" class="form-label required-label">Dusun</label>
              <select class="form-select @error('ds_id') is-invalid @enderror" name="dsn_id" id="dsn_id" style="cursor: pointer;" required>
                <option value="" disabled selected>Pilih Dusun</option>
                <option id="Kandangan" @if(old('dsn_id')=='Kandangan' ) selected @endif value="Kandangan">Kandangan</option>
                <option id="Ngadiluwih" @if(old('dsn_id')=='Ngadiluwih' ) selected @endif value="Ngadiluwih">Ngadiluwih</option>
              </select>
              @error('dsn_id')
              <div class="invalid-feedback" style="margin-bottom: -3px;">
                {{ $message }}
              </div>
              @enderror
            </div>  
            <div class="col">
              
            </div>            
          </div>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-danger cancelModalTakePatientQueue" data-bs-dismiss="modal"><i class='bx bx-share fs-6' style="margin-bottom: 3px;"></i>&nbsp;Batal</button>
          <button type="submit" class="btn btn-primary"><i class='bx bx-receipt fs-6' style="margin-bottom: 3px;"></i>&nbsp;Submit</button>
        </div>
      </div>
    </form>
  </div>
</div>
@section('script')
<script src="{{ asset('assets/js/patients.js') }}"></script>
@endsection
@endsection