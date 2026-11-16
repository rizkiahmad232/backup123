<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">

        <!-- Dashboard -->
        <li class="nav-item">
            <a class="nav-link {{ Request::is('dashboard') ? '' : 'collapsed' }}" href="{{ route('dashboard') }}">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <!-- Kelola User (Admin Only) -->
        <li class="nav-item">
            <a class="nav-link {{ Request::is('dashboard/users*') ? '' : 'collapsed' }}" href="{{ route('users.index') }}">
                <i class="bi bi-people"></i>
                <span>Kelola User</span>
            </a>
        </li>

        <!-- Tambahkan Menu Lain di Bawah -->
        {{-- Example:
        <li class="nav-item">
            <a class="nav-link {{ Request::is('dashboard/tasks*') ? '' : 'collapsed' }}" href="{{ route('tasks.index') }}">
                <i class="bi bi-list-task"></i>
                <span>Kelola Tugas</span>
            </a>
        </li>
        --}}
    </ul>
</aside>
