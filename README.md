# 🐾 LocalPet

> Aplicativo mobile para conectar donos de pets com serviços locais — veterinários, pet shops, adoção e muito mais.

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Google Maps](https://img.shields.io/badge/Google%20Maps-4285F4?style=for-the-badge&logo=googlemaps&logoColor=white)](https://pub.dev/packages/google_maps_flutter)
[![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)](https://pub.dev/packages/sqflite)

---

## 📱 Sobre o projeto

**LocalPet** é um aplicativo Flutter desenvolvido para facilitar a vida de donos de animais de estimação. Com ele, é possível localizar serviços pet próximos usando Google Maps, registrar e gerenciar pets, e se conectar com a comunidade local de tutores.

O projeto foi desenvolvido como trabalho acadêmico prático, aplicando boas práticas de desenvolvimento mobile multiplataforma (Android & iOS).

---

## ✨ Funcionalidades

- 📍 **Mapa interativo** com localização de serviços pet próximos (Google Maps)
- 🐶 **Cadastro de pets** com foto, nome, raça e informações de saúde
- 📷 **Upload e edição de fotos** com recorte e compressão de imagem
- 🔍 **Scanner de código de barras** para produtos pet
- 📢 **Denúncias** de maus-tratos a animais
- 💾 **Banco de dados local** com SQLite para funcionamento offline
- 🎨 **Splash screen animada** e interface moderna

---

## 🛠️ Tecnologias utilizadas

| Pacote | Uso |
|---|---|
| `flutter` / `dart` | Framework principal multiplataforma |
| `google_maps_flutter` | Mapa interativo com geolocalização |
| `location` | Acesso à localização do dispositivo |
| `sqflite` + `path_provider` | Banco de dados local SQLite |
| `image_picker` + `image_cropper` | Upload e edição de fotos |
| `flutter_image_compress` | Otimização de imagens |
| `flutter_barcode_scanner` | Leitura de códigos de barras |
| `animated_splash_screen` | Tela de carregamento animada |
| `url_launcher` | Links externos e telefone |
| `intl` | Formatação de datas e strings |

---

## 🚀 Como rodar o projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) >= 2.12.0
- Android Studio ou VS Code com extensão Flutter
- Dispositivo físico ou emulador Android/iOS

### Instalação

```bash
# Clone o repositório
git clone https://github.com/LayonIaemori/LOCALPET.git
cd LOCALPET

# Instale as dependências
flutter pub get

# Rode o app
flutter run
```

> ⚠️ Para usar o Google Maps, é necessário configurar uma chave de API no arquivo `android/app/src/main/AndroidManifest.xml`.

---

## 🗂️ Estrutura do projeto

```
LOCALPET/
├── lib/               # Código Dart principal
│   └── ...            # Telas, widgets e lógica
├── assets/            # Imagens e recursos estáticos
│   ├── logo.png
│   ├── local.png
│   └── ...
├── android/           # Configurações nativas Android
├── ios/               # Configurações nativas iOS
├── pubspec.yaml       # Dependências do projeto
└── README.md
```

---

## 🔮 Próximas melhorias

- [ ] Autenticação com Firebase (login/cadastro)
- [ ] Feed de postagens da comunidade pet
- [ ] Chat entre tutores e estabelecimentos
- [ ] Agendamento de consultas e banho & tosa
- [ ] Publicação na Google Play Store

---

## 👤 Autor

**Layon Iaemori**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/layoniaemori/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/LayonIaemori)

---

<div align="center">
  <sub>Feito com ❤️ por Layon Iaemori</sub>
</div>
