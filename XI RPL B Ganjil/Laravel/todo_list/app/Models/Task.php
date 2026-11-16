<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'judul',
        'deskripsi',
        'deadline',
        'status',
        'id_user',
    ];

    protected $casts = [
        'deadline' => 'datetime',
    ];

    protected $attributes = [
        'status' => 'tertunda',
    ];

    /**
     * Relasi ke user
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    /**
     * Scope untuk pencarian task berdasarkan filter
     */
    public function scopeSearch($query, $filters)
    {
        return $query
            ->when($filters['search'] ?? false, function ($query, $search) {
                $query->where('judul', 'like', '%' . $search . '%');
            })
            ->when($filters['status'] ?? null, function ($query, $status) {
                $query->where('status', $status);
            })
            ->where('id_user', auth()->id());
    }

    /**
     * Scope untuk menghitung jumlah task berdasarkan status
     */
    public function scopeCountByStatus($query, $status = null)
    {
        return $query->where('id_user', auth()->id())
            ->when($status, fn($query) => $query->where('status', $status))
            ->count();
    }
}
