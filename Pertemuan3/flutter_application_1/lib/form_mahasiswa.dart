import 'package:flutter/material.dart';

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  // --- Form key & step
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0; // hanya 1 step (index 0)

  // --- Controller & field (BAGIAN 1)
  final cNama = TextEditingController();
  final cNpm = TextEditingController();
  final cEmail = TextEditingController();
  final cAlamat = TextEditingController();
  final cTelepon = TextEditingController();

  String? jk; // jenis kelamin
  String? prodi;
  String? semester;

  DateTime? tglLahir;
  TimeOfDay? jamBimbingan;

  String get tglLahirLabel => tglLahir == null
      ? 'Pilih tanggal'
      : '${tglLahir!.day}/${tglLahir!.month}/${tglLahir!.year}';

  String get jamLabel =>
      jamBimbingan == null ? 'Pilih jam' : jamBimbingan!.format(context);

  @override
  void dispose() {
    cNama.dispose();
    cNpm.dispose();
    cEmail.dispose();
    cAlamat.dispose();
    cTelepon.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final res = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year + 1),
      initialDate: DateTime(now.year - 18, now.month, now.day),
    );
    if (res != null) setState(() => tglLahir = res);
  }

  Future<void> _pickTime() async {
    final res = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (res != null) setState(() => jamBimbingan = res);
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Periksa kembali isian Anda.')),
      );
      return;
    }
    if (tglLahir == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tanggal lahir belum dipilih')),
      );
      return;
    }
    if (jamBimbingan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Jam bimbingan belum dipilih')),
      );
      return;
    }
    if (jk == null || prodi == null || semester == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lengkapi pilihan dropdown Anda')),
      );
      return;
    }

    final data = {
      'nama': cNama.text.trim(),
      'npm': cNpm.text.trim(),
      'email': cEmail.text.trim(),
      'alamat': cAlamat.text.trim(),
      'telepon': cTelepon.text.trim(),
      'jenis_kelamin': jk,
      'prodi': prodi,
      'semester': semester,
      'tglLahir': tglLahirLabel,
      'jamBimbingan': jamLabel,
    };

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ringkasan Data (Bagian 1)'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('${e.key}: ${e.value}'),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final steps = <Step>[
      Step(
        title: const Text('Identitas'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Data Pribadi'),
            TextFormField(
              controller: cNama,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                hintText: 'cth: Aulia Rahman',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Nama wajib diisi' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: cNpm,
              decoration: const InputDecoration(
                labelText: 'NPM',
                hintText: '231063*',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'NPM wajib diisi' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: cEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'unsika123@gmail.com',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Email wajib diisi' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: cAlamat,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                hintText: 'cth: Jl. Merdeka No. 123',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Alamat wajib diisi' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: cTelepon,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                hintText: 'cth: 0812xxxxxxx',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Telepon wajib diisi' : null,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: jk,
              decoration: const InputDecoration(
                labelText: 'Jenis Kelamin',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.wc),
              ),
              items: const [
                DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
              ],
              onChanged: (v) => setState(() => jk = v),
              validator: (v) => v == null ? 'Pilih jenis kelamin' : null,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: prodi,
              decoration: const InputDecoration(
                labelText: 'Program Studi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
              items: const [
                DropdownMenuItem(
                    value: 'Sistem Informasi', child: Text('Sistem Informasi')),
                DropdownMenuItem(
                    value: 'Informatika', child: Text('Informatika')),
              ],
              onChanged: (v) => setState(() => prodi = v),
              validator: (v) => v == null ? 'Pilih program studi' : null,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: semester,
              decoration: const InputDecoration(
                labelText: 'Semester',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timeline),
              ),
              items: List.generate(
                8,
                (i) => DropdownMenuItem(
                  value: '${i + 1}',
                  child: Text('Semester ${i + 1}'),
                ),
              ),
              onChanged: (v) => setState(() => semester = v),
              validator: (v) => v == null ? 'Pilih semester' : null,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.cake_outlined),
                    label: Text(tglLahirLabel),
                    onPressed: _pickDate,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.schedule),
                    label: Text(jamLabel),
                    onPressed: _pickTime,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Form Mahasiswa')),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep, // selalu 0
          steps: steps,
          onStepContinue: _simpan, // tombol lanjut = Simpan untuk 1 step
          onStepCancel: null, // tidak perlu tombol kembali
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 10), // kasih jarak atas
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan'),
                      onPressed: details.onStepContinue,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
