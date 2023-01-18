OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[6];
cx q[5], q[3];
x q[5];
cx q[8], q[5];
cx q[7], q[2];
cx q[6], q[5];
