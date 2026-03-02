import 'package:flutter/material.dart';

void main() {
  runApp(const ComputoBogotaApp());
}

class ComputoBogotaApp extends StatelessWidget {
  const ComputoBogotaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servicios de Cómputo Bogotá',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B57D0)),
        useMaterial3: true,
      ),
      home: const ServiciosHomePage(),
    );
  }
}

class ServiciosHomePage extends StatelessWidget {
  const ServiciosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soporte Técnico en Bogotá'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mantenimiento, reparación y asesoría para equipos de cómputo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Atendemos hogares, estudiantes, emprendedores y empresas en Bogotá. '
              'Nuestros técnicos ofrecen diagnóstico confiable, soluciones rápidas '
              'y acompañamiento para mejorar el rendimiento de tus equipos.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            _ServiceSection(
              title: 'Mantenimiento',
              description:
                  'Prevención y optimización para alargar la vida útil de tus equipos.',
              prices: const [
                PriceRow('Mantenimiento preventivo portátil', 'Desde COP 120.000'),
                PriceRow('Mantenimiento preventivo PC de escritorio', 'Desde COP 150.000'),
                PriceRow('Limpieza interna y cambio de pasta térmica', 'Desde COP 95.000'),
                PriceRow('Optimización de sistema operativo', 'Desde COP 80.000'),
              ],
            ),
            const SizedBox(height: 18),
            _ServiceSection(
              title: 'Reparación',
              description:
                  'Solución de fallas de hardware y software con diagnóstico inicial.',
              prices: const [
                PriceRow('Diagnóstico técnico', 'COP 50.000'),
                PriceRow('Reparación de sistema operativo', 'Desde COP 140.000'),
                PriceRow('Cambio de disco HDD a SSD (sin repuesto)', 'Desde COP 110.000'),
                PriceRow('Cambio de pantalla portátil (mano de obra)', 'Desde COP 180.000'),
                PriceRow('Recuperación básica de datos', 'Desde COP 160.000'),
              ],
            ),
            const SizedBox(height: 18),
            _ServiceSection(
              title: 'Asesoría',
              description:
                  'Acompañamiento especializado para compra, configuración y seguridad.',
              prices: const [
                PriceRow('Asesoría para compra de equipos', 'COP 90.000 / hora'),
                PriceRow('Configuración de oficina en casa', 'Desde COP 130.000'),
                PriceRow('Implementación de copias de seguridad', 'Desde COP 120.000'),
                PriceRow('Asesoría en ciberseguridad básica', 'COP 100.000 / hora'),
              ],
            ),
            const SizedBox(height: 28),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Cobertura en Bogotá: Chapinero, Suba, Engativá, Teusaquillo, '
                  'Kennedy, Usaquén y localidades cercanas.\n'
                  'Los valores pueden variar según repuestos, complejidad y servicio a domicilio.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceSection extends StatelessWidget {
  const _ServiceSection({
    required this.title,
    required this.description,
    required this.prices,
  });

  final String title;
  final String description;
  final List<PriceRow> prices;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 4),
            Text(description),
            const SizedBox(height: 12),
            Table(
              border: TableBorder.all(color: Colors.black12),
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(2),
              },
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Color(0xFFE8F0FE)),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Servicio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Precio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ...prices.map(
                  (row) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(row.service),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(row.price),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PriceRow {
  const PriceRow(this.service, this.price);

  final String service;
  final String price;
}
