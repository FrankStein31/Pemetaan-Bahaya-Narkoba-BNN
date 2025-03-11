@if(auth()->check() && auth()->user()->is_admin == 1)
<li class="menu-item {{ Request::is('admin/dashboard*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/dashboard'">
    <i class="menu-icon tf-icons bx bx-desktop"></i>
    <div>Dashboard</div>
  </a>
</li>
<li class="menu-item {{ Request::is('admin/pasien*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/pasien'">
    <i class="menu-icon tf-icons bx bx-group"></i>
    <div>Data Pengadu</div>
  </a>
</li>
<li class="menu-item {{ Request::is('admin/warga*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/warga'">
    <i class="menu-icon tf-icons bx bx-group"></i>
    <div>Data Warga</div>
  </a>
</li>
<li class="menu-item {{ Request::routeIs('sosialisasi.index') ? 'active' : '' }} ">
  <a class="menu-link cursor-pointer" href="{{ route('sosialisasi.index') }}">
    <i class="menu-icon tf-icons bx bx-street-view"></i>
    <div>Sosialisasi</div>
  </a>
</li>
<li class="menu-item {{ Request::is('admin/antrian*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/antrian'">
    <i class="menu-icon tf-icons bx bx-message-alt-error"></i>
    <div>Pendaftaran Aduan</div>
  </a>
</li>
<!-- <li class="menu-item {{ Request::is('admin/daftar-antrian-terlambat*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/daftar-antrian-terlambat'">
    <i class="menu-icon tf-icons bx bx-recycle"></i>
    <div>Antrian Terlambat</div>
  </a>
</li> -->
{{-- <li class="menu-item {{ Request::routeIs('pengaduan.index') ? 'active' : '' }}">
  <a class="menu-link" href="{{ route('pengaduan.index') }}">
    <i class="menu-icon tf-icons bx bx-message-dots"></i>
    <div>Laporan Pengaduan</div>
  </a>
</li> --}}
<li class="menu-item {{ Request::routeIs('pengaduan.index') ? 'active' : '' }}">
  <a class="menu-link" href="{{ route('pengaduan.index') }}">
    <i class="menu-icon tf-icons bx bx-message-dots"></i>
    <div>Laporan Pengaduan</div>
  </a>
</li>


<li class="menu-item {{ Request::routeIs('messages.index') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" href="{{ route('messages.index') }}">
    <i class="menu-icon tf-icons bx bx-support"></i>
    <div>Kritik & Saran</div>
  </a>
</li>

<li class="menu-item {{ Request::is('admin/pengaturan*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/pengaturan'">
    <i class="menu-icon tf-icons bx bx-cog"></i>
    <div>Pengaturan</div>
  </a>
</li>

@else
<li class="menu-item {{ Request::is('masyarakat/dashboard*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/masyarakat/dashboard'">
    <i class="menu-icon tf-icons bx bx-desktop"></i>
    <div>Dashboard</div>
  </a>
</li>
{{-- <li class="menu-item {{ Request::is('admin/pasien*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/pasien'">
    <i class="menu-icon tf-icons bx bx-group"></i>
    <div>Data Pasien</div>
  </a>
</li>
<li class="menu-item {{ Request::is('admin/warga*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/warga'">
    <i class="menu-icon tf-icons bx bx-group"></i>
    <div>Data Warga</div>
  </a>
</li> --}}

<li class="menu-item {{ Request::is('admin/pengaturan*') ? 'active' : '' }}">
  <a class="menu-link cursor-pointer" onclick="window.location.href='/admin/pengaturan'">
    <i class="menu-icon tf-icons bx bx-cog"></i>
    <div>Pengaturan</div>
  </a>
</li>
@endif