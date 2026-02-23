import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_button.dart';

class AddGoalPage extends StatefulWidget {
  const AddGoalPage({super.key});

  @override
  State<AddGoalPage> createState() => _AddGoalPageState();
}

class _AddGoalPageState extends State<AddGoalPage> {
  late FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'title': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)],
      ),
      'description': FormControl<String>(),
      'category': FormControl<String>(
        validators: [Validators.required],
      ),
      'deadline': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'priority': FormControl<String>(
        value: 'medium',
        validators: [Validators.required],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add New Goal'),
        actions: [
          TextButton(
            onPressed: _saveGoal,
            child: const Text('Save'),
          ),
        ],
      ),
      body: ReactiveForm(
        formGroup: form,
        child: ListView(
          padding: AppPadding.medium,
          children: [
            Card(
              child: Padding(
                padding: AppPadding.medium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Goal Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ReactiveTextField(
                      formControlName: 'title',
                      decoration: const InputDecoration(
                        labelText: 'Goal Title',
                        hintText: 'What do you want to achieve?',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (_) => 'Title is required',
                        ValidationMessage.minLength: (_) => 'Title must be at least 3 characters',
                      },
                    ),
                    const SizedBox(height: 16),
                    ReactiveTextField(
                      formControlName: 'description',
                      decoration: const InputDecoration(
                        labelText: 'Description (Optional)',
                        hintText: 'Describe your goal in detail...',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    ReactiveDropdownField<String>(
                      formControlName: 'category',
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                      items: const [
                        DropdownMenuItem(value: 'personal', child: Text('Personal Development')),
                        DropdownMenuItem(value: 'career', child: Text('Career')),
                        DropdownMenuItem(value: 'education', child: Text('Education')),
                        DropdownMenuItem(value: 'health', child: Text('Health & Fitness')),
                        DropdownMenuItem(value: 'finance', child: Text('Finance')),
                        DropdownMenuItem(value: 'relationships', child: Text('Relationships')),
                        DropdownMenuItem(value: 'hobbies', child: Text('Hobbies')),
                        DropdownMenuItem(value: 'other', child: Text('Other')),
                      ],
                      validationMessages: {
                        ValidationMessage.required: (_) => 'Please select a category',
                      },
                    ),
                    const SizedBox(height: 16),
                    ReactiveTextField(
                      formControlName: 'deadline',
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Deadline',
                        hintText: 'Select deadline date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: (control) => _selectDate(context, control as FormControl<DateTime>),
                      validationMessages: {
                        ValidationMessage.required: (_) => 'Please select a deadline',
                      },
                    ),
                    const SizedBox(height: 16),
                    ReactiveDropdownField<String>(
                      formControlName: 'priority',
                      decoration: const InputDecoration(
                        labelText: 'Priority',
                      ),
                      items: const [
                        DropdownMenuItem(value: 'low', child: Text('Low')),
                        DropdownMenuItem(value: 'medium', child: Text('Medium')),
                        DropdownMenuItem(value: 'high', child: Text('High')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: AppPadding.medium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Additional Options',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Send reminders'),
                      subtitle: const Text('Get notifications about your progress'),
                      value: true,
                      onChanged: (value) {},
                      contentPadding: EdgeInsets.zero,
                    ),
                    SwitchListTile(
                      title: const Text('Track daily progress'),
                      subtitle: const Text('Enable daily progress tracking'),
                      value: true,
                      onChanged: (value) {},
                      contentPadding: EdgeInsets.zero,
                    ),
                    SwitchListTile(
                      title: const Text('Share with friends'),
                      subtitle: const Text('Let friends see your progress'),
                      value: false,
                      onChanged: (value) {},
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, FormControl<DateTime> control) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );

    if (selectedDate != null) {
      control.updateValue(selectedDate);
    }
  }

  void _saveGoal() {
    if (form.valid) {
      // TODO: Save goal to repository
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Goal created successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      form.markAllAsTouched();
    }
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}