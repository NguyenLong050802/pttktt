import 'package:flutter/material.dart';
import 'question/question10/ui/question10.dart';
import 'question/question11/ui/question11.dart';
import 'question/question12/ui/question12.dart';
import 'question/question13/ui/question13.dart';
import 'question/question14/ui/question14.dart';
import 'question/question3/ui/question3.dart';
import 'question/question4/ui/question4.dart';
import 'question/question5/ui/question5.dart';
import 'question/question6/ui/question6.dart';
import 'question/question7/ui/question7.dart';
import 'question/question8/ui/question8.dart';
import 'question/question9/ui/question9.dart';
import 'question/question1/ui/question1.dart';
import 'question/question2/ui/question2.dart';

class QuestionDetail extends StatefulWidget {
  final int id;
  const QuestionDetail({super.key, required this.id});

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Question ${widget.id + 1}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: showBody(context),
      ),
    );
  }

  Widget showBody(BuildContext context) {
    switch (widget.id) {
      case 0:
        return question1(context);
      case 1:
        return const Question2View();
      case 2:
        return const Question3View();
      case 3:
        return question4(context);
      case 4:
        return question5(context);
      case 5:
        return question6(context);
      case 6:
        return question7(context);
      case 7:
        return question8(context);
      case 8:
        return question9(context);
      case 9:
        return question10(context);
      case 10:
        return const Question11View();
      case 11:
        return const Question12View();
      case 12:
        return question13(context);
      case 13:
        return question14(context);
      default:
        return question1(context);
    }
  }
}
