import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/do-work/widgets/do_work_job.dart';

class JobsData {
  static List<DoWorkJobs> getMockedJobs() {
    return [
      DoWorkJobs(
        name: 'Dat cu grebla',
        loc: 'Oradea',
        shortdescription: 'Am nevoie de cineva sa dea cu grebla prin curte',
        price: '100',
        hours: '2-3 ore',
        rating: '4.0',
        category: 'Gradinarit',
        date: '15 August',
        when: 'Intre orele 16 si 19',
        longdescription: 'Am nevoie de cineva sa dea cu grebla prin curte.',
      ),
      DoWorkJobs(
        name: 'Amenajat pomi',
        loc: 'Oradea',
        shortdescription: 'Aranjat pomii',
        price: '300',
        hours: '4-5 ore',
        rating: '4.0',
        category: 'Gradinarit',
        date: '29 August',
        when: 'Intre orele 12 si 17',
        longdescription:
            'Vreau sa amenajez curtea si am nevoie de ajutor in plantarea pomilor.',
      ),
      DoWorkJobs(
        name: 'Ingrijit flori',
        loc: 'Oradea',
        shortdescription: 'Aranjat flori',
        price: '150',
        hours: '2-3 ore',
        rating: '4.0',
        category: 'Gradinarit',
        date: '1 Septembrie',
        when: 'Intre orele 14 si 17',
        longdescription:
            'Caut pe cineva care se pricepe la taiat si ingrijit flori.',
      ),
      DoWorkJobs(
        name: 'Tuns gazon',
        loc: 'Oradea',
        shortdescription: 'Ajutor la tuns gazon',
        price: '100',
        hours: '1-2 ore',
        rating: '4.0',
        category: 'Gradinarit',
        date: '15 August',
        when: 'Intre orele 14 si 16',
        longdescription: 'Am nevoie de o persoana care sa imi tunda gazonul.',
      ),
      DoWorkJobs(
        name: 'Scos buruieni',
        loc: 'Oradea',
        shortdescription: 'Scos de buruieni',
        price: '100',
        hours: '1 ora',
        rating: '4.0',
        category: 'Gradinarit',
        date: '15 August',
        when: 'Intre orele 13 si 14',
        longdescription:
            'Imi trebuie cineva care sa smulga buruienile de prin curte.',
      ),
    ];
  }
}
