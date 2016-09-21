FasdUAS 1.101.10   ��   ��    k             l      ��  ��   <6
set today to (current date)

if run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_task_run.scpt") with parameters today then return false

if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/wait_till_network_available.scpt") with parameters today) then return false
     � 	 	l 
 s e t   t o d a y   t o   ( c u r r e n t   d a t e ) 
 
 i f   r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / i s _ d a i l y _ t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   t o d a y   t h e n   r e t u r n   f a l s e 
 
 i f   n o t   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / L i b / w a i t _ t i l l _ n e t w o r k _ a v a i l a b l e . s c p t " )   w i t h   p a r a m e t e r s   t o d a y )   t h e n   r e t u r n   f a l s e 
   
  
 l     ��������  ��  ��        l      ��  ��   ��
set is_sync to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.scpt")
log is_sync
if false = is_sync or 0 = is_sync then
	tell application "Evernote"
		display alert �
			"Error" message �
			("Evernote Sync for too long time!
Maybe any error appeared?
Please Re-execute Daily_Task manually~") �
				as warning �
			buttons {"Stop"}
	end tell
	return false
end if
     �  " 
 s e t   i s _ s y n c   t o   r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / E v e r n o t e / e v e r n o t e _ l a u n c h . s c p t " ) 
 l o g   i s _ s y n c 
 i f   f a l s e   =   i s _ s y n c   o r   0   =   i s _ s y n c   t h e n 
 	 t e l l   a p p l i c a t i o n   " E v e r n o t e " 
 	 	 d i s p l a y   a l e r t   � 
 	 	 	 " E r r o r "   m e s s a g e   � 
 	 	 	 ( " E v e r n o t e   S y n c   f o r   t o o   l o n g   t i m e ! 
 M a y b e   a n y   e r r o r   a p p e a r e d ? 
 P l e a s e   R e - e x e c u t e   D a i l y _ T a s k   m a n u a l l y ~ " )   � 
 	 	 	 	 a s   w a r n i n g   � 
 	 	 	 b u t t o n s   { " S t o p " } 
 	 e n d   t e l l 
 	 r e t u r n   f a l s e 
 e n d   i f 
      l     ��������  ��  ��        l      ��  ��   ��
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "add_day_log"}) then
	delay 3
	if false � (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/add_day_log.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "add_day_log"}
		delay 7
	end if
end if
     �  l 
 i f   n o t   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / i s _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " a d d _ d a y _ l o g " } )   t h e n 
 	 d e l a y   3 
 	 i f   f a l s e  "`   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / a d d _ d a y _ l o g . s c p t " )   w i t h   p a r a m e t e r s   t o d a y )   t h e n 
 	 	 r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s e t _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " a d d _ d a y _ l o g " } 
 	 	 d e l a y   7 
 	 e n d   i f 
 e n d   i f 
      l     ��������  ��  ��        l      ��  ��   ��
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "stat_day"}) then
	if false � (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/stat_day.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "stat_day"}
		delay 7
	end if
end if
     �  H 
 i f   n o t   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / i s _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " s t a t _ d a y " } )   t h e n 
 	 i f   f a l s e  "`   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s t a t _ d a y . s c p t " )   w i t h   p a r a m e t e r s   t o d a y )   t h e n 
 	 	 r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s e t _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " s t a t _ d a y " } 
 	 	 d e l a y   7 
 	 e n d   i f 
 e n d   i f 
       l     ��������  ��  ��      ! " ! l      �� # $��   #��
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "stat_week"}) then
	if false � (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/stat_week.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "stat_week"}
		delay 7
	end if
end if
    $ � % %N 
 i f   n o t   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / i s _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " s t a t _ w e e k " } )   t h e n 
 	 i f   f a l s e  "`   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s t a t _ w e e k . s c p t " )   w i t h   p a r a m e t e r s   t o d a y )   t h e n 
 	 	 r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s e t _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " s t a t _ w e e k " } 
 	 	 d e l a y   7 
 	 e n d   i f 
 e n d   i f 
 "  & ' & l     ��������  ��  ��   '  ( ) ( l      �� * +��   *��
if not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/is_daily_subtask_run.scpt") with parameters {today, "stat_month"}) then
	if false � (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/stat_month.scpt") with parameters today) then
		run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_subtask_run.scpt") with parameters {today, "stat_month"}
		delay 7
	end if
end if
    + � , ,T 
 i f   n o t   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / i s _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " s t a t _ m o n t h " } )   t h e n 
 	 i f   f a l s e  "`   ( r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s t a t _ m o n t h . s c p t " )   w i t h   p a r a m e t e r s   t o d a y )   t h e n 
 	 	 r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s e t _ d a i l y _ s u b t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   { t o d a y ,   " s t a t _ m o n t h " } 
 	 	 d e l a y   7 
 	 e n d   i f 
 e n d   i f 
 )  - . - l     ��������  ��  ��   .  /�� / l      �� 0 1��   0 � �
run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/add_job_report.scpt") with parameters today

return run script (POSIX file "/Users/IceHe/Documents/AppleScript/Stat/set_daily_task_run.scpt") with parameters today
    1 � 2 2� 
 r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / a d d _ j o b _ r e p o r t . s c p t " )   w i t h   p a r a m e t e r s   t o d a y 
 
 r e t u r n   r u n   s c r i p t   ( P O S I X   f i l e   " / U s e r s / I c e H e / D o c u m e n t s / A p p l e S c r i p t / S t a t / s e t _ d a i l y _ t a s k _ r u n . s c p t " )   w i t h   p a r a m e t e r s   t o d a y 
��       �� 3��   3  ascr  ��ޭ