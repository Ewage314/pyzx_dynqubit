OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[1];
cx q[8], q[7];
cx q[6], q[3];
cx q[7], q[2];
cx q[8], q[5];
