// import 'package:customertech/controller/support_controller.dart';
// import 'package:customertech/utility/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SupportScreen extends StatelessWidget {
//   const SupportScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SupportController());
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
//       appBar: AppBar(
//         title: Text(
//           'Support & Help',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: isDark ? kTextDark : kTextDark,
//             fontSize: 18,
//           ),
//         ),
//         backgroundColor: isDark ? kCardDark : kPrimaryColor,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Quick Contact Options
//             Container(
//               margin: const EdgeInsets.all(kDefaultPadding),
//               padding: const EdgeInsets.all(kDefaultPadding),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     isDark ? kPrimaryDarkColor : kPrimaryColor,
//                     isDark
//                         ? kPrimaryDarkColor.withOpacity(0.8)
//                         : kPrimaryColor.withOpacity(0.8),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(kCardBorderRadius),
//                 boxShadow: [
//                   BoxShadow(
//                     color: (isDark ? kPrimaryDarkColor : kPrimaryColor)
//                         .withOpacity(0.3),
//                     blurRadius: 12,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     'Need Help?',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'We\'re here to assist you 24/7',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white.withOpacity(0.9),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildQuickAction(
//                         icon: Icons.phone,
//                         label: 'Call',
//                         onTap: () => _makePhoneCall('1800-123-4567'),
//                       ),
//                       _buildQuickAction(
//                         icon: Icons.email,
//                         label: 'Email',
//                         onTap: () => _sendEmail('support@example.com'),
//                       ),
//                       _buildQuickAction(
//                         icon: Icons.chat_bubble,
//                         label: 'Chat',
//                         onTap: () => controller.openChat(),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // FAQs Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: Text(
//                 'Frequently Asked Questions',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: isDark ? kTextDark : kTextLight,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),

//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               itemCount: controller.faqs.length,
//               itemBuilder: (context, index) {
//                 final faq = controller.faqs[index];
//                 final isExpanded = controller.expandedIndex.value == index;

//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   decoration: BoxDecoration(
//                     color: isDark ? kCardDark : kCardLight,
//                     borderRadius: BorderRadius.circular(kCardBorderRadius),
//                     border: Border.all(
//                       color: isDark
//                           ? const Color(0xFF334155)
//                           : const Color(0xFFE2E8F0),
//                       width: 1,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: isDark
//                             ? Colors.black.withOpacity(0.2)
//                             : Colors.black.withOpacity(0.05),
//                         blurRadius: 8,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Theme(
//                     data: Theme.of(
//                       context,
//                     ).copyWith(dividerColor: Colors.transparent),
//                     child: ExpansionTile(
//                       title: Text(
//                         faq['question']!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           color: isDark ? kTextDark : kTextLight,
//                         ),
//                       ),
//                       trailing: Icon(
//                         isExpanded
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                       ),
//                       onExpansionChanged: (expanded) {
//                         controller.toggleFAQ(expanded ? index : -1);
//                       },
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//                           child: Text(
//                             faq['answer']!,
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: isDark ? kSubtextDark : kSubtextLight,
//                               height: 1.5,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 24),

//             // Contact Form Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: Text(
//                 'Send us a Message',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: isDark ? kTextDark : kTextLight,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               padding: const EdgeInsets.all(kDefaultPadding),
//               decoration: BoxDecoration(
//                 color: isDark ? kCardDark : kCardLight,
//                 borderRadius: BorderRadius.circular(kCardBorderRadius),
//                 border: Border.all(
//                   color: isDark
//                       ? const Color(0xFF334155)
//                       : const Color(0xFFE2E8F0),
//                   width: 1,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: isDark
//                         ? Colors.black.withOpacity(0.2)
//                         : Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: controller.nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Your Name',
//                       labelStyle: TextStyle(
//                         color: isDark ? kSubtextDark : kSubtextLight,
//                       ),
//                       prefixIcon: Icon(
//                         Icons.person_outline,
//                         color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark
//                               ? const Color(0xFF334155)
//                               : const Color(0xFFE2E8F0),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark
//                               ? const Color(0xFF334155)
//                               : const Color(0xFFE2E8F0),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                     style: TextStyle(color: isDark ? kTextDark : kTextLight),
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: controller.emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email Address',
//                       labelStyle: TextStyle(
//                         color: isDark ? kSubtextDark : kSubtextLight,
//                       ),
//                       prefixIcon: Icon(
//                         Icons.email_outlined,
//                         color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark
//                               ? const Color(0xFF334155)
//                               : const Color(0xFFE2E8F0),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark
//                               ? const Color(0xFF334155)
//                               : const Color(0xFFE2E8F0),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                     style: TextStyle(color: isDark ? kTextDark : kTextLight),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: controller.messageController,
//                     decoration: InputDecoration(
//                       labelText: 'Your Message',
//                       labelStyle: TextStyle(
//                         color: isDark ? kSubtextDark : kSubtextLight,
//                       ),
//                       prefixIcon: Icon(
//                         Icons.message_outlined,
//                         color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark
//                               ? const Color(0xFF334155)
//                               : const Color(0xFFE2E8F0),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark
//                               ? const Color(0xFF334155)
//                               : const Color(0xFFE2E8F0),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: isDark ? kPrimaryDarkColor : kPrimaryColor,
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                     style: TextStyle(color: isDark ? kTextDark : kTextLight),
//                     maxLines: 4,
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: controller.submitMessage,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: isDark
//                             ? kPrimaryDarkColor
//                             : kPrimaryColor,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         elevation: 2,
//                       ),
//                       child: const Text(
//                         'Send Message',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickAction({
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, color: Colors.white, size: 28),
//             const SizedBox(height: 6),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _makePhoneCall(String phoneNumber) async {
//     final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
//     await launchUrl(launchUri);
//   }

//   Future<void> _sendEmail(String email) async {
//     final Uri launchUri = Uri(scheme: 'mailto', path: email);
//     await launchUrl(launchUri);
//   }
// }










import 'package:customertech/controller/support_controller.dart';
import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kBackgroundDark : kBackgroundLight,
      appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
        title: Text(
          'Support & Help',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? kTextDark : kTextLight,
            fontSize: 18,
          ),
        ),
       
        elevation: 0,
        automaticallyImplyLeading: true,
         iconTheme: IconThemeData(color: getTextColor(isDark)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Contact Options
            Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isDark ? kPrimaryColorDark : kPrimaryColorLight,
                    isDark ? kPrimaryColorDark.withOpacity(0.85) : kPrimaryColorLight.withOpacity(0.85),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(kCardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: (isDark ? kPrimaryColorDark : kPrimaryColorLight).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Need Help?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? kTextDark : kTextDark
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We\'re here to assist you 24/7',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? kSubtextDark : kSubtextLight,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuickAction(
                        icon: Icons.phone,
                        label: 'Call',
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        onTap: () => _makePhoneCall('1800-123-4567'),
                      ),
                      _buildQuickAction(
                        icon: Icons.email,
                        label: 'Email',
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        onTap: () => _sendEmail('support@example.com'),
                      ),
                      _buildQuickAction(
                        icon: Icons.chat_bubble,
                        label: 'Chat',
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        onTap: () => controller.openChat(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FAQs Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
            ),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              itemCount: controller.faqs.length,
              itemBuilder: (context, index) {
                final faq = controller.faqs[index];
                final isExpanded = controller.expandedIndex.value == index;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: isDark ? kCardDark : kCardLight,
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    border: Border.all(
                      color: isDark ? kSubtextDark.withOpacity(0.5) : kSubtextLight.withOpacity(0.5),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(
                        faq['question']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: isDark ? kTextDark : kTextLight,
                        ),
                      ),
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      ),
                      onExpansionChanged: (expanded) {
                        controller.toggleFAQ(expanded ? index : -1);
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Text(
                            faq['answer']!,
                            style: TextStyle(
                              fontSize: 13,
                              color: isDark ? kSubtextDark : kSubtextLight,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Contact Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                'Send us a Message',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? kTextDark : kTextLight,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isDark ? kCardDark : kCardLight,
                borderRadius: BorderRadius.circular(kCardBorderRadius),
                border: Border.all(
                  color: isDark ? kSubtextDark.withOpacity(0.5) : kSubtextLight.withOpacity(0.5),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      labelStyle: TextStyle(
                        color: isDark ? kSubtextDark : kSubtextLight,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: isDark ? kBackgroundDark.withOpacity(0.4) : kBackgroundLight.withOpacity(0.9),
                    ),
                    style: TextStyle(color: isDark ? kTextDark : kTextLight),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: isDark ? kSubtextDark : kSubtextLight,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: isDark ? kBackgroundDark.withOpacity(0.4) : kBackgroundLight.withOpacity(0.9),
                    ),
                    style: TextStyle(color: isDark ? kTextDark : kTextLight),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.messageController,
                    decoration: InputDecoration(
                      labelText: 'Your Message',
                      labelStyle: TextStyle(
                        color: isDark ? kSubtextDark : kSubtextLight,
                      ),
                      prefixIcon: Icon(
                        Icons.message_outlined,
                        color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: isDark ? kBackgroundDark.withOpacity(0.4) : kBackgroundLight.withOpacity(0.9),
                    ),
                    style: TextStyle(color: isDark ? kTextDark : kTextLight),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.submitMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? kPrimaryColorDark : kPrimaryColorLight,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Send Message',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Semantics(
      label: 'Quick action: $label',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.4), width: 1),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(scheme: 'mailto', path: email);
    await launchUrl(launchUri);
  }
}