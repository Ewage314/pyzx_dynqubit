OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[13];
cx q[11], q[9];
z q[10];
cx q[15], q[1];
cx q[11], q[13];
