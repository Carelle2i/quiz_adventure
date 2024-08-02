import 'package:flutter/cupertino.dart';
import 'road_code_model.dart';

const Color cardColor = Color(0xFF4993FA);

final List<RoadCodeCategory> roadCodeCategories = [
  RoadCodeCategory(
    id: 0,
    categoryName: "Panneaux de signalisation",
    categoryIcon: CupertinoIcons.stop_circle,
    categoryColor: cardColor,
    questions: [
      RoadCodeQuestion(
        id: 0,
        text: "Que signifie un panneau de stop ?",
        options: [
          const RoadCodeOption(text: "Arrêter", isCorrect: true),
          const RoadCodeOption(text: "Ralentir", isCorrect: false),
          const RoadCodeOption(text: "Céder le passage", isCorrect: false),
          const RoadCodeOption(text: "Aucune de ces réponses", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Arrêter", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 1,
        text: "Que signifie un panneau de limitation de vitesse avec un cercle rouge et le nombre 50 ?",
        options: [
          const RoadCodeOption(text: "Vitesse minimale 50 km/h", isCorrect: false),
          const RoadCodeOption(text: "Vitesse maximale 50 km/h", isCorrect: true),
          const RoadCodeOption(text: "Zone de danger", isCorrect: false),
          const RoadCodeOption(text: "Interdiction de dépasser", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Vitesse maximale 50 km/h", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 2,
        text: "Que signifie un panneau triangulaire avec un bord rouge et un dessin de cerf ?",
        options: [
          const RoadCodeOption(text: "Attention, animaux sauvages", isCorrect: true),
          const RoadCodeOption(text: "Réserve naturelle", isCorrect: false),
          const RoadCodeOption(text: "Interdiction de chasser", isCorrect: false),
          const RoadCodeOption(text: "Zone de camping", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Attention, animaux sauvages", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 3,
        text: "Que signifie un panneau carré bleu avec un 'P' blanc ?",
        options: [
          const RoadCodeOption(text: "Parking", isCorrect: true),
          const RoadCodeOption(text: "Interdiction de stationner", isCorrect: false),
          const RoadCodeOption(text: "Arrêt de bus", isCorrect: false),
          const RoadCodeOption(text: "Zone piétonne", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Parking", isCorrect: true),
      ),
    ],
  ),
  RoadCodeCategory(
    id: 1,
    categoryName: "Règles de priorité",
    categoryIcon: CupertinoIcons.arrow_right_circle,
    categoryColor: cardColor,
    questions: [
      RoadCodeQuestion(
        id: 4,
        text: "Qui a la priorité à une intersection sans signalisation ?",
        options: [
          const RoadCodeOption(text: "Le véhicule venant de gauche", isCorrect: false),
          const RoadCodeOption(text: "Le véhicule venant de droite", isCorrect: true),
          const RoadCodeOption(text: "Le véhicule le plus rapide", isCorrect: false),
          const RoadCodeOption(text: "Aucun véhicule", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Le véhicule venant de droite", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 5,
        text: "Quelle est la règle de priorité lorsque vous entrez dans un rond-point ?",
        options: [
          const RoadCodeOption(text: "Priorité à droite", isCorrect: false),
          const RoadCodeOption(text: "Priorité aux véhicules dans le rond-point", isCorrect: true),
          const RoadCodeOption(text: "Priorité aux piétons", isCorrect: false),
          const RoadCodeOption(text: "Priorité au plus gros véhicule", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Priorité aux véhicules dans le rond-point", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 6,
        text: "Que devez-vous faire lorsque vous voyez un panneau cédez le passage ?",
        options: [
          const RoadCodeOption(text: "Vous arrêter complètement", isCorrect: false),
          const RoadCodeOption(text: "Ralentir et céder le passage aux autres véhicules", isCorrect: true),
          const RoadCodeOption(text: "Accélérer pour passer rapidement", isCorrect: false),
          const RoadCodeOption(text: "Ignorer le panneau", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Ralentir et céder le passage aux autres véhicules", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 7,
        text: "A une intersection avec des feux de signalisation, que devez-vous faire si le feu est jaune ?",
        options: [
          const RoadCodeOption(text: "Accélérer pour passer avant que le feu ne devienne rouge", isCorrect: false),
          const RoadCodeOption(text: "Ralentir et se préparer à s'arrêter", isCorrect: true),
          const RoadCodeOption(text: "Continuer à la même vitesse", isCorrect: false),
          const RoadCodeOption(text: "S'arrêter immédiatement", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Ralentir et se préparer à s'arrêter", isCorrect: true),
      ),
    ],
  ),
  RoadCodeCategory(
    id: 2,
    categoryName: "Vitesse",
    categoryIcon: CupertinoIcons.speedometer,
    categoryColor: cardColor,
    questions: [
      RoadCodeQuestion(
        id: 8,
        text: "Quelle est la limite de vitesse dans une zone résidentielle ?",
        options: [
          const RoadCodeOption(text: "30 km/h", isCorrect: true),
          const RoadCodeOption(text: "50 km/h", isCorrect: false),
          const RoadCodeOption(text: "70 km/h", isCorrect: false),
          const RoadCodeOption(text: "90 km/h", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "30 km/h", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 9,
        text: "Quelle est la limite de vitesse sur une autoroute en France ?",
        options: [
          const RoadCodeOption(text: "110 km/h", isCorrect: false),
          const RoadCodeOption(text: "130 km/h", isCorrect: true),
          const RoadCodeOption(text: "150 km/h", isCorrect: false),
          const RoadCodeOption(text: "180 km/h", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "130 km/h", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 10,
        text: "Quelle est la vitesse maximale autorisée dans une zone scolaire pendant les heures de classe ?",
        options: [
          const RoadCodeOption(text: "20 km/h", isCorrect: false),
          const RoadCodeOption(text: "30 km/h", isCorrect: true),
          const RoadCodeOption(text: "50 km/h", isCorrect: false),
          const RoadCodeOption(text: "70 km/h", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "30 km/h", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 11,
        text: "En cas de pluie, quelle doit être votre vitesse sur une autoroute si la limite normale est de 130 km/h ?",
        options: [
          const RoadCodeOption(text: "110 km/h", isCorrect: true),
          const RoadCodeOption(text: "130 km/h", isCorrect: false),
          const RoadCodeOption(text: "90 km/h", isCorrect: false),
          const RoadCodeOption(text: "70 km/h", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "110 km/h", isCorrect: true),
      ),
    ],
  ),
  RoadCodeCategory(
    id: 3,
    categoryName: "Conduite et sécurité",
    categoryIcon: CupertinoIcons.car_detailed,
    categoryColor: cardColor,
    questions: [
      RoadCodeQuestion(
        id: 12,
        text: "Que devez-vous faire si vous voyez un piéton traverser la route sur un passage pour piétons ?",
        options: [
          const RoadCodeOption(text: "Klaxonner pour l'avertir", isCorrect: false),
          const RoadCodeOption(text: "S'arrêter et le laisser passer", isCorrect: true),
          const RoadCodeOption(text: "Accélérer pour passer avant lui", isCorrect: false),
          const RoadCodeOption(text: "Contourner le piéton", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "S'arrêter et le laisser passer", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 13,
        text: "Que devez-vous faire si vous entendez une sirène de véhicule d'urgence derrière vous ?",
        options: [
          const RoadCodeOption(text: "Continuer à la même vitesse", isCorrect: false),
          const RoadCodeOption(text: "Accélérer pour dégager la route", isCorrect: false),
          const RoadCodeOption(text: "Ralentir mais rester sur la route", isCorrect: false),
          const RoadCodeOption(text: "Céder le passage en vous arrêtant sur le côté", isCorrect: true),
        ],
        correctAnswer: const RoadCodeOption(text: "Céder le passage en vous arrêtant sur le côté", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 14,
        text: "Quel est l'intervalle de temps minimum à maintenir entre votre véhicule et celui qui vous précède ?",
        options: [
          const RoadCodeOption(text: "1 seconde", isCorrect: false),
          const RoadCodeOption(text: "2 secondes", isCorrect: true),
          const RoadCodeOption(text: "3 secondes", isCorrect: false),
          const RoadCodeOption(text: "4 secondes", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "2 secondes", isCorrect: true),
      ),
      RoadCodeQuestion(
        id: 15,
        text: "Quelle est la première chose à faire en cas d'accident de la route sans blessé ?",
        options: [
          const RoadCodeOption(text: "Appeler les secours", isCorrect: false),
          const RoadCodeOption(text: "Déplacer les véhicules sur le côté de la route", isCorrect: true),
          const RoadCodeOption(text: "Signaler l'accident aux autorités", isCorrect: false),
          const RoadCodeOption(text: "Prendre des photos de la scène", isCorrect: false),
        ],
        correctAnswer: const RoadCodeOption(text: "Déplacer les véhicules sur le côté de la route", isCorrect: true),
      ),
    ],
  ),
];
